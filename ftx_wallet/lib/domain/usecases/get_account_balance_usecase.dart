import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';

class GetAccountBalanceUsecase
    implements UseCase<Map<String, double>, NoParams> {
  final WalletRepository _repository;

  GetAccountBalanceUsecase(this._repository) {}

  @override
  Future<Either<Failure, Map<String, double>>> call(NoParams params) async {
    var failureOrAllBalance = (await _repository.getAllBalances())
        .fold((failure) => failure, (ballances) => ballances);
    if (failureOrAllBalance is Failure) {
      return Left(failureOrAllBalance);
    }
    var allBalance = failureOrAllBalance as Map<String, List<FtxCoin>>;

    var totalUsdValue = Map<String, double>();
    allBalance.forEach((subaccount, balances) {
      double usdValue = 0;
      balances.forEach((ftxCoin) {
        usdValue += ftxCoin.usdValue;
      });
      totalUsdValue[subaccount] = usdValue;
    });
    return Right(totalUsdValue);
  }
}
