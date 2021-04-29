import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/transform/income_statement.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';
import 'package:ftx_wallet/domain/usecases/get_account_balance_usecase.dart';
import 'package:ftx_wallet/domain/usecases/get_account_init_invest_usecase.dart';

class GetIncomeStatementUsecase
    implements UseCase<List<IncomeStatement>, NoParams> {
  final WalletRepository _repository;
  GetAccountInitInvestUsecase _getAccountInitInvestUsecase;
  GetAccountBalanceUsecase _getAccountBalanceUsecase;

  GetIncomeStatementUsecase(this._repository) {
    _getAccountInitInvestUsecase = GetAccountInitInvestUsecase(_repository);
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

    var futures = [
      _getAccountInitInvestUsd(subaccounts),
      _getAccountBalanceUsd()
    ];
    final results = await Future.wait(futures);

    var failureOrTotalUsd = results[0].fold((failure) => failure, (totalUsd) => totalUsd);
    if (failureOrTotalUsd is Failure) {
      return Left(failureOrTotalUsd);
    }
    var totalUsd = failureOrTotalUsd as Map<String, double>;

    var failureOrTotalNetUsd = results[1]
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

    return (await _getAccountInitInvestUsecase(InitInvestParams(allSubaccounts: subaccounts))).fold(
            (failure) => Left(failure),
            (initInvest) => Right(initInvest));
  }

}
