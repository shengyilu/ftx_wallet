import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';

abstract class WalletRepository {
  Future<Either<Failure, List<FtxCoin>>> fetchBalance();
}