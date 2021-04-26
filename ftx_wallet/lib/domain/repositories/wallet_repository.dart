import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_withdrawal_history.dart';

abstract class WalletRepository {
  Future<Either<Failure, List<FtxCoin>>> getBalance(String subaccount);
  Future<Either<Failure, Map<String, List<FtxCoin>>>> getAllBalances();
  Future<Either<Failure, Map<String, List<FtxDepositHistory>>>> getDeposits(
      String subaccount);
  Future<Either<Failure, List<String>>> getAllSubaccounts();
  Future<Either<Failure, Map<String, List<FtxWithdrawalHistory>>>>
      getWithdrawals(String subaccount);
}
