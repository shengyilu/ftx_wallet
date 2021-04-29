import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/ftx_withdrawal_history.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';

class GetAccountWithdrawalHistoryUsecase
    implements UseCase<Map<String, double>, WithdrwalParams> {
  final WalletRepository _repository;

  GetAccountWithdrawalHistoryUsecase(this._repository) {}

  @override
  Future<Either<Failure, Map<String, double>>> call(
      WithdrwalParams params) async {
    var subaccounts = params.allSubaccounts;

    List<Future<Either<Failure, Map<String, List<FtxWithdrawalHistory>>>>>
        futures = [];
    subaccounts.forEach((accountName) {
      futures.add(_repository.getWithdrawals(accountName));
    });
    final results = await Future.wait(futures);

    var withdrawals = Map<String, double>();
    results.forEach((result) {
      var failureOr = result.fold((failure) {
        return failure;
      }, (withdrawalMap) {
        withdrawalMap.forEach((key, ftxWithdrawalHistories) {
          double size = 0;
          ftxWithdrawalHistories.forEach((ftxWithdrawalHistory) {
            if (ftxWithdrawalHistory.coin == params.coin) {
              size += ftxWithdrawalHistory.size;
            }
          });
          withdrawals[key] = size;
        });
      });
      if (failureOr is Failure) {
        return Left(failureOr);
      }
    });
    return Right(withdrawals);
  }
}

class WithdrwalParams extends Equatable {
  final List<String> allSubaccounts;
  final String coin;

  WithdrwalParams({this.allSubaccounts, this.coin});

  @override
  List<Object> get props => [allSubaccounts, coin];
}
