import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_subaccount.dart';

abstract class WalletRepository {
  Future<Either<Failure, List<FtxCoin>>> getBalance(String subaccount);
  Future<Either<Failure, Map<String, List<FtxCoin>>>> getAllBalances();
  Future<Either<Failure, List<FtxDepositHistory>>> getDeposits();
  Future<Either<Failure, List<FtxSubaccount>>> getAllSubaccounts();
}
