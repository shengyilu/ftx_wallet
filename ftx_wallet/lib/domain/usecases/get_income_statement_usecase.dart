import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/transform/income_statement.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';
import 'package:ftx_wallet/domain/usecases/get_account_balance_usecase.dart';
import 'package:ftx_wallet/domain/usecases/get_account_withdrawal_history_usecase.dart';

import 'get_account_deposit_history_usecase.dart';

class GetIncomeStatementUsecase
    implements UseCase<List<IncomeStatement>, NoParams> {
  final WalletRepository _repository;
  GetAccountWithdrawalHistoryUsecase _getAccountWithdrawalHistoryUsecase;
  GetAccountDepositHistoryUsecase _getAccountDepositHistoryUsecase;
  GetAccountBalanceUsecase _getAccountBalanceUsecase;

  GetIncomeStatementUsecase(this._repository) {
    _getAccountWithdrawalHistoryUsecase =
        GetAccountWithdrawalHistoryUsecase(_repository);
    _getAccountDepositHistoryUsecase =
        GetAccountDepositHistoryUsecase(_repository);
    _getAccountBalanceUsecase = GetAccountBalanceUsecase(_repository);
  }

  @override
  Future<Either<Failure, List<IncomeStatement>>> call(NoParams params) async {
    return (await _getIncomeStatement()).fold((failure) => Left(failure),
        (incomeStatements) => Right(incomeStatements));
  }

  Future<Either<Failure, List<IncomeStatement>>> _getIncomeStatement() async {
    var failureOrSubaccounts = (await _getSubaccount())
        .fold((failure) => failure, (totalUsd) => totalUsd);
    if (failureOrSubaccounts is Failure) {
      return Left(failureOrSubaccounts);
    }
    var subaccounts = failureOrSubaccounts as List<String>;

    var failureOrTotalUsd = (await _getAccountInitInvestUsd(subaccounts))
        .fold((failure) => failure, (totalUsd) => totalUsd);
    if (failureOrTotalUsd is Failure) {
      return Left(failureOrTotalUsd);
    }
    var totalUsd = failureOrTotalUsd as Map<String, double>;

    var failureOrTotalNetUsd = (await _getAccountBalanceUsd())
        .fold((failure) => failure, (totalNetUsd) => totalNetUsd);
    if (failureOrTotalNetUsd is Failure) {
      return Left(failureOrTotalNetUsd);
    }
    var totalNetUsd = failureOrTotalNetUsd as Map<String, double>;

    List<IncomeStatement> incomeStatements = [];
    subaccounts.forEach((subaccount) {
      incomeStatements.add(IncomeStatement(
          accountName: subaccount,
          totalNetUsd: totalNetUsd[subaccount],
          depositUsd: totalUsd[subaccount]));
    });

    return Right(incomeStatements);
  }

  Future<Either<Failure, List<String>>> _getSubaccount() async {
    var test = await _repository.getAllSubaccounts();

    return test.fold((failure) {
      return Left(failure);
    }, (subaccounts) {
      return Right(subaccounts);
    });
  }

  Future<Either<Failure, Map<String, double>>> _getAccountBalanceUsd() async {
    return (await _getAccountBalanceUsecase(NoParams()))
        .fold((failure) => Left(failure), (balances) => Right(balances));
  }

  Future<Either<Failure, Map<String, double>>> _getAccountInitInvestUsd(
      List<String> subaccounts) async {
    var failureOrWithdrawals = await _getAllWithdrawalHistory(subaccounts);
    if (failureOrWithdrawals.isLeft()) {
      Left(failureOrWithdrawals.leftMap((l) => l));
    }
    var withdrawls = failureOrWithdrawals.getOrElse(null);

    var failureOrDeposits = await _getAllDepositHistory(subaccounts);
    if (failureOrDeposits.isLeft()) {
      Left(failureOrDeposits.leftMap((l) => l));
    }
    var deposits = failureOrDeposits.getOrElse(null);

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
