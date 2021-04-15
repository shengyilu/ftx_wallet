import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';

class GetDeposiHistoryUseCase
    implements UseCase<List<FtxDepositHistory>, NoParams> {
  final WalletRepository _repository;

  GetDeposiHistoryUseCase(this._repository);

  @override
  Future<Either<Failure, List<FtxDepositHistory>>> call(NoParams params) {
    return _repository.getDeposits();
  }
}
