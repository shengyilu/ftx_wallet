
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';

import 'get_account_deposit_history_usecase.dart';
import 'get_account_withdrawal_history_usecase.dart';

class GetAccountInitInvestUsecase
    implements UseCase<Map<String, double>, InitInvestParams> {
  final WalletRepository _repository;
  GetAccountWithdrawalHistoryUsecase _getAccountWithdrawalHistoryUsecase;
  GetAccountDepositHistoryUsecase _getAccountDepositHistoryUsecase;

  GetAccountInitInvestUsecase(this._repository) {
    _getAccountWithdrawalHistoryUsecase =
        GetAccountWithdrawalHistoryUsecase(_repository);
    _getAccountDepositHistoryUsecase =
        GetAccountDepositHistoryUsecase(_repository);
  }

  @override
  Future<Either<Failure, Map<String, double>>> call(InitInvestParams params) async {
    return (await _getAccountInitInvestUsd(params.allSubaccounts)).fold(
            (failure) => Left(failure),
            (initInvest) => Right(initInvest));
  }

  Future<Either<Failure, Map<String, double>>> _getAccountInitInvestUsd(
      List<String> subaccounts) async {

    List<Future<Either<Failure, Map<String, double>>>> futures = [
      _getAllWithdrawalHistory(subaccounts),
      _getAllDepositHistory(subaccounts)
    ];
    final results = await Future.wait(futures);

    var failureOrWithdrawals = results[0].fold(
            (failure) => failure,
            (withdrawals) => withdrawals);

    if (failureOrWithdrawals is Failure) {
      return Left(failureOrWithdrawals);
    }
    var withdrawls = failureOrWithdrawals as Map<String, double>;

    var failureOrDeposits = results[1].fold(
            (failure) => failure,
            (deposits) => deposits);
    if (failureOrDeposits is Failure) {
      return Left(failureOrDeposits);
    }
    var deposits = failureOrDeposits as Map<String, double>;

    final initUsd = Map<String, double>();
    double totalUsd = 0;
    subaccounts.forEach((account) {
      double totalDepositUsd = deposits[account];
      double totalWithdrawalUsd = withdrawls[account];
      totalUsd = totalDepositUsd - totalWithdrawalUsd;
      initUsd[account] = totalUsd;
    });

    return Right(initUsd);
  }

  Future<Either<Failure, Map<String, double>>> _getAllDepositHistory(
      List<String> subaccounts) async {
    return (await _getAccountDepositHistoryUsecase(
        DepositParams(allSubaccounts: subaccounts, coin: "USD")))
        .fold((failure) => Left(failure), (deposits) => Right(deposits));
  }

  Future<Either<Failure, Map<String, double>>> _getAllWithdrawalHistory(
      List<String> subaccounts) async {
    return (await _getAccountWithdrawalHistoryUsecase(
        WithdrwalParams(allSubaccounts: subaccounts, coin: "USD")))
        .fold((failure) => Left(failure), (withdrawals) => Right(withdrawals));
  }

}


class InitInvestParams extends Equatable {
  final List<String> allSubaccounts;

  InitInvestParams({this.allSubaccounts});

  @override
  List<Object> get props => [allSubaccounts];
}
