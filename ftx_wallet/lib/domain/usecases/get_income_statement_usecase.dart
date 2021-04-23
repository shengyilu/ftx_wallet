import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/helper/account_info_check_impl.dart';
import 'package:ftx_wallet/core/helper/account_info_checker.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_withdrawal_history.dart';
import 'package:ftx_wallet/data/model/transform/income_statement.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetIncomeStatementUsecase
    implements UseCase<List<IncomeStatement>, NoParams> {
  final WalletRepository _repository;
  AccountInfoChecker _accountInfoChecker;
  GetIncomeStatementUsecase(this._repository) {
    this._accountInfoChecker = AccountInfoCheckerImpl();

  }

  @override
  Future<Either<Failure, List<IncomeStatement>>> call(NoParams params) async {
    return (await _getIncomeStatement()).fold(
            (failure) => Left(failure),
            (incomeStatements) => Right(incomeStatements));
  }

  Future<Either<Failure, List<IncomeStatement>>> _getIncomeStatement() async {

    var failureOrSubaccounts = (await _getSubaccount()).fold(
            (failure) => failure,
            (totalUsd) => totalUsd);
    if (failureOrSubaccounts is Failure) {
      return Left(failureOrSubaccounts);
    }
    var subaccounts = failureOrSubaccounts as List<String>;


    var failureOrTotalUsd = (await _getAccountInitInvestUsd(subaccounts)).fold(
            (failure) => failure,
            (totalUsd) => totalUsd);
    if (failureOrTotalUsd is Failure) {
      return Left(failureOrTotalUsd);
    }
    var totalUsd = failureOrTotalUsd as Map<String, double>;


    var failureOrAllBalance = (await _repository.getAllBalances()).fold(
            (failure) => failure,
            (ballances) => ballances);
    if (failureOrAllBalance is Failure) {
      return Left(failureOrAllBalance);
    }
    var allBalance = failureOrAllBalance as Map<String, List<FtxCoin>>;

    List<IncomeStatement> incomeStatements = [];
    subaccounts.forEach((subaccount) {
      double totaNetUsd = 0;
      allBalance[subaccount].forEach((balance) {
        totaNetUsd += balance.usdValue;
      });
      incomeStatements.add(IncomeStatement(accountName: subaccount, totalNetUsd: totaNetUsd, depositUsd: totalUsd[subaccount]));
    });

    return Right(incomeStatements);
  }

  Future<Either<Failure, List<String>>> _getSubaccount() async {
    var test = await _repository.getAllSubaccounts();

    return test.fold(
            (failure) {
              return Left(failure);
            },
            (subaccounts) {
              return Right(subaccounts);
            });
  }

  Future<Either<Failure, Map<String, double>>> _getAccountInitInvestUsd(List<String> subaccounts) async {
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
      double totalDepositUsd = 0;
      deposits[account].forEach((ftxDepositHistory) {
        if (ftxDepositHistory.coin == "USD") {
          totalDepositUsd += ftxDepositHistory.size;
        }
      });

      double totalWithdrawalUsd = 0;
      withdrawls[account].forEach((ftxWithdrawaHistory) {
        if (ftxWithdrawaHistory.coin == "USD") {
          totalWithdrawalUsd += ftxWithdrawaHistory.size;
        }
      });
      totalUsd = totalDepositUsd - totalWithdrawalUsd;
      initUsd[account] = totalUsd;
    });

    return Right(initUsd);
  }

  Future<Either<Failure, Map<String, List<FtxDepositHistory>>>> _getAllDepositHistory(List<String> subaccounts) async {
    List<Future<Either<Failure, List<FtxDepositHistory>>>> futures = [];
    subaccounts.forEach((accountName) async {
      futures.add(_repository.getDeposits(accountName));
    });
    final results = await Future.wait(futures);
    print("[Edward] results runtime type:${results.runtimeType}");

    var deposits = Map<String, List<FtxDepositHistory>>();
    for (var i = 0; i < subaccounts.length; i++) {
      var result = results[i].fold(
              (failure) {
                return failure;
              },
              (depositHistories) {
                deposits[subaccounts[i]] = depositHistories;
              });
      if (result is Failure) {
        return Left(result);
      }
    }
    return Right(deposits);
  }

  Future<Either<Failure, Map<String, List<FtxWithdrawalHistory>>>> _getAllWithdrawalHistory(List<String> subaccounts) async {
    List<Future<Either<Failure, List<FtxWithdrawalHistory>>>> futures = [];
    subaccounts.forEach((accountName) async {
      futures.add(_repository.getWithdrawals(accountName));
    });
    final results = await Future.wait(futures);

    var withdrawals = Map<String, List<FtxWithdrawalHistory>>();
    for (var i = 0; i < subaccounts.length; i++) {
      var result = results[i].fold(
              (failure) => failure,
              (withdrawlhistories) {
                withdrawals[subaccounts[i]] = withdrawlhistories;
          });
      if (result is Failure) {
        return Left(result);
      }
    }

    print("[Edward] withdrawals:$withdrawals");
    return Right(withdrawals);
  }



}
