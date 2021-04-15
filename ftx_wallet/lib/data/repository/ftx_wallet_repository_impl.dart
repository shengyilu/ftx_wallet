import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/network/network_info.dart';
import 'package:ftx_wallet/data/datasources/ftx_wallet_remote_data_source.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';

class FtxWalletRepositoryImpl implements WalletRepository {
  FtxWalletRemoteDataSource _ftxWalletRemoteDataSourceImpl;
  NetworkInfo _networkInfo;

  FtxWalletRepositoryImpl() {
    this._ftxWalletRemoteDataSourceImpl = FtxWalletRemoteDataSourceImpl();
    this._networkInfo = NetworkInfoImpl();
  }

  @override
  Future<Either<Failure, List<FtxCoin>>> fetchBalance() async {
    if (await _networkInfo.isConnected) {
      try {
        return Right(await _ftxWalletRemoteDataSourceImpl.fetchBalance());
      } catch (e) {
        String failedMessage = 'unknown';
        if (e is Response) {
          failedMessage = e.body;
        }
        return Left(ServerFailure(failedMessage));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<FtxDepositHistory>>> getDeposits() async {
    if (await _networkInfo.isConnected) {
      try {
        return Right(await _ftxWalletRemoteDataSourceImpl.getDepositHistory());
      } catch (e) {
        String failedMessage = 'unknown';
        if (e is Response) {
          failedMessage = e.body;
        }
        return Left(ServerFailure(failedMessage));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
