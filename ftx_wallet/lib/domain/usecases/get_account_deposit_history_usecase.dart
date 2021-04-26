import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';

class GetAccountDepositHistoryUsecase
    implements UseCase<Map<String, double>, DepositParams> {
  final WalletRepository _repository;

  GetAccountDepositHistoryUsecase(this._repository) {}

  @override
  Future<Either<Failure, Map<String, double>>> call(
      DepositParams params) async {
    var subaccounts = params.allSubaccounts;
    List<Future<Either<Failure, Map<String, List<FtxDepositHistory>>>>>
        futures = [];
    subaccounts.forEach((accountName) async {
      futures.add(_repository.getDeposits(accountName));
    });
    final results = await Future.wait(futures);

    var deposits = Map<String, double>();
    results.forEach((result) {
      var failureOr = result.fold((failure) => failure, (depositMap) {
        depositMap.forEach((key, ftxDepositHistories) {
          double size = 0;
          ftxDepositHistories.forEach((ftxDepositHistory) {
            if (ftxDepositHistory.coin == "USD") {
              size += ftxDepositHistory.size;
            }
          });
          deposits[key] = size;
        });
      });
      if (failureOr is Failure) {
        return Left(failureOr);
      }
    });

    return Right(deposits);
  }
}

class DepositParams extends Equatable {
  final List<String> allSubaccounts;
  final String coin;

  DepositParams({this.allSubaccounts, this.coin});

  @override
  List<Object> get props => [allSubaccounts];
}
