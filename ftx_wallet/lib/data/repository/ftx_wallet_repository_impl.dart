import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/helper/account_info_check_impl.dart';
import 'package:ftx_wallet/core/helper/account_info_checker.dart';
import 'package:ftx_wallet/core/helper/hive_helper.dart';
import 'package:ftx_wallet/core/helper/hive_helper_impl.dart';
import 'package:ftx_wallet/core/network/network_info.dart';
import 'package:ftx_wallet/data/datasources/ftx_wallet_remote_data_source.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_withdrawal_history.dart';
import 'package:ftx_wallet/data/model/transform/income_statement.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';
import 'package:hive/hive.dart';

class FtxWalletRepositoryImpl implements WalletRepository {
  AccountInfoChecker _accountInfoChecker;
  HiveHelper _hiveHelper;
  FtxWalletRemoteDataSource _ftxWalletRemoteDataSourceImpl;
  NetworkInfo _networkInfo;

  FtxWalletRepositoryImpl() {
    this._ftxWalletRemoteDataSourceImpl = FtxWalletRemoteDataSourceImpl();
    this._networkInfo = NetworkInfoImpl();
    this._accountInfoChecker = AccountInfoCheckerImpl();
    this._hiveHelper = HiveHelperImpl();
  }

  @override
  Future<Either<Failure, List<FtxCoin>>> getBalance(String subaccount) async {
    try {
      return Right(await _ftxWalletRemoteDataSourceImpl.getBalance(subaccount));
    } on Response catch (e) {
      var failedMessage = e.body;
      return Left(ServerFailure(failedMessage));
    }
  }

  @override
  Future<Either<Failure, Map<String, List<FtxDepositHistory>>>> getDeposits(
      String subaccount) async {
    try {
      if ((await _accountInfoChecker.isUpdateDepositWithdrawalHistory())) {
        try {
          var remoteDepositHistories = await _ftxWalletRemoteDataSourceImpl.getDepositHistory(subaccount);
          await _hiveHelper.saveDepositHistory(remoteDepositHistories);
          await _accountInfoChecker.updateSyncTime(AccountInfoChecker.DEPOSIT_WITHDRAWAL_UPDATE_TIME, DateTime.now());
          return Right(remoteDepositHistories);
        } on Response catch (e) {
          await _accountInfoChecker.updateSyncTime(AccountInfoChecker.DEPOSIT_WITHDRAWAL_UPDATE_TIME, null);
          var failedMessage = e.body;
          return Left(ServerFailure(failedMessage));
        }
      } else {
        var localDepositHistories = await _hiveHelper.getDepositHistory(subaccount);
        return Right(localDepositHistories);
      }
    } finally {
      await _hiveHelper.close();
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAllSubaccounts() async {
    try {
      if ((await _accountInfoChecker.isUpdateAccountInfo())) {
        // Get from remote
        try {
          var remoteSubaccounts =
          await _ftxWalletRemoteDataSourceImpl.getAllSubaccounts();
          await _hiveHelper.saveSubaccounts(remoteSubaccounts);
          await _accountInfoChecker.updateSyncTime(AccountInfoChecker.SUBACCOUT_UPDATE_TIME, DateTime.now());
          return Right(remoteSubaccounts);
        } catch (e) {
          await _accountInfoChecker.updateSyncTime(AccountInfoChecker.SUBACCOUT_UPDATE_TIME, null);
          String failedMessage = 'unknown';
          if (e is Response) {
            failedMessage = e.body;
          }
          return Left(ServerFailure(failedMessage));
        }
      } else {
        // Get from local
        var localSubaccounts = await _hiveHelper.getSubaccounts();
        return Right(localSubaccounts);
      }
    } finally {
      await _hiveHelper.close();
    }
  }

  @override
  Future<Either<Failure, Map<String, List<FtxCoin>>>> getAllBalances() async {
    try {
      return Right(await _ftxWalletRemoteDataSourceImpl.getAllBalance());
    } on Response catch (e) {
      var failedMessage = e.body;
      return Left(ServerFailure(failedMessage));
    }
  }

  @override
  Future<Either<Failure, Map<String, List<FtxWithdrawalHistory>>>>
      getWithdrawals(String subaccount) async {
    try {
      if ((await _accountInfoChecker.isUpdateDepositWithdrawalHistory())) {
        try {
          var remoteWithdrawals = await _ftxWalletRemoteDataSourceImpl
              .getWithdrawalHistory(subaccount);
          await _hiveHelper.saveWithdrawalHistory(remoteWithdrawals);
          await _accountInfoChecker.updateSyncTime(AccountInfoChecker.DEPOSIT_WITHDRAWAL_UPDATE_TIME, DateTime.now());

          return Right(remoteWithdrawals);
        } on Response catch (e) {
          await _accountInfoChecker.updateSyncTime(AccountInfoChecker.DEPOSIT_WITHDRAWAL_UPDATE_TIME, null);
          var failedMessage = e.body;
          return Left(ServerFailure(failedMessage));
        }
      } else {
        // Get from local
        var localWithdrawals = await _hiveHelper.getWithdrawalHistory(subaccount);
        return Right(localWithdrawals);
      }
    } finally {
      await _hiveHelper.close();
    }

  }
}
