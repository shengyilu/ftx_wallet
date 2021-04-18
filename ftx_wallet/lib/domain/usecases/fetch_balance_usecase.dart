import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';

class FetchBalanceUseCase implements UseCase<List<FtxCoin>, NoParams> {
  final WalletRepository _repository;

  FetchBalanceUseCase(this._repository);

  @override
  Future<Either<Failure, List<FtxCoin>>> call(NoParams params) {
    return _repository.getBalance('BTMX-3');
  }
}
