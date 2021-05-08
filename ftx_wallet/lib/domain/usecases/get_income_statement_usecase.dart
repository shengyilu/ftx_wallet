import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/transform/income_statement.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';
import 'package:ftx_wallet/domain/usecases/get_account_balance_usecase.dart';
import 'package:ftx_wallet/domain/usecases/get_account_init_invest_usecase.dart';
import 'package:ftx_wallet/domain/usecases/get_funding_payment_usecase.dart';

class GetIncomeStatementUsecase
    implements UseCase<List<IncomeStatement>, NoParams> {
  final WalletRepository _repository;
  GetAccountInitInvestUsecase _getAccountInitInvestUsecase;
  GetAccountBalanceUsecase _getAccountBalanceUsecase;
  GetFundingPaymentUsecase _getFundingPaymentUsecase;

  GetIncomeStatementUsecase(this._repository) {
    _getAccountInitInvestUsecase = GetAccountInitInvestUsecase(_repository);
    _getAccountBalanceUsecase = GetAccountBalanceUsecase(_repository);
    _getFundingPaymentUsecase = GetFundingPaymentUsecase(_repository);
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
      _getAccountBalanceUsd(),
      _getFundingPayment(subaccounts)
    ];
    final results = await Future.wait(futures);

    var failureOrTotalUsd =
        results[0].fold((failure) => failure, (totalUsd) => totalUsd);
    if (failureOrTotalUsd is Failure) {
      return Left(failureOrTotalUsd);
    }
    var totalUsd = failureOrTotalUsd as Map<String, double>;

    var failureOrTotalNetUsd =
        results[1].fold((failure) => failure, (totalNetUsd) => totalNetUsd);
    if (failureOrTotalNetUsd is Failure) {
      return Left(failureOrTotalNetUsd);
    }
    var totalNetUsd = failureOrTotalNetUsd as Map<String, double>;

    var failureOrFundindPayments = results[2]
        .fold((failure) => failure, (fundingPayments) => fundingPayments);
    if (failureOrFundindPayments is Failure) {
      return Left(failureOrFundindPayments);
    }
    var fundingPaymentsMap =
        failureOrFundindPayments as Map<String, List<double>>;

    List<IncomeStatement> incomeStatements = [];
    subaccounts.forEach((subaccount) {
      incomeStatements.add(IncomeStatement(
        accountName: subaccount,
        totalNetUsd: totalNetUsd[subaccount],
        depositUsd: totalUsd[subaccount],
        latestFundingPayment: fundingPaymentsMap[subaccount].length != 0
            ? fundingPaymentsMap[subaccount][0]
            : 0,
        totalFundingPayment: fundingPaymentsMap[subaccount].length != 0
            ? (fundingPaymentsMap[subaccount])
                .reduce((value, element) => value + element)
            : 0,
      ));
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
    return (await _getAccountInitInvestUsecase(
            InitInvestParams(allSubaccounts: subaccounts)))
        .fold((failure) => Left(failure), (initInvest) => Right(initInvest));
  }

  Future<Either<Failure, Map<String, List<double>>>> _getFundingPayment(
      List<String> subaccounts) async {
    return (await _getFundingPaymentUsecase(
            FundingPaymentParams(allSubaccounts: subaccounts)))
        .fold((failure) => Left(failure),
            (fundingPayments) => Right(fundingPayments));
  }
}
