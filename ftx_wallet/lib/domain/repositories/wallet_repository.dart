import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';

abstract class WalletRepository {
  Future<Either<Failure, List<FtxCoin>>> fetchBalance();
  Future<Either<Failure, List<FtxDepositHistory>>> getDeposits();

}