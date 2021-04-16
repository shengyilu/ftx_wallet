import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_subaccount.dart';
import 'package:ftx_wallet/data/model/transform/income_statement.dart';

abstract class WalletRepository {
  Future<Either<Failure, List<FtxCoin>>> fetchBalance();
  Future<Either<Failure, List<FtxDepositHistory>>> getDeposits();
  Future<Either<Failure, List<FtxSubaccount>>> getAllSubaccounts();

}