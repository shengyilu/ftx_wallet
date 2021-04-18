import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/network/network_info.dart';
import 'package:ftx_wallet/data/datasources/ftx_wallet_remote_data_source.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_subaccount.dart';
import 'package:ftx_wallet/data/model/transform/income_statement.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';

class FtxWalletRepositoryImpl implements WalletRepository {
  FtxWalletRemoteDataSource _ftxWalletRemoteDataSourceImpl;
  NetworkInfo _networkInfo;

  FtxWalletRepositoryImpl() {
    this._ftxWalletRemoteDataSourceImpl = FtxWalletRemoteDataSourceImpl();
    this._networkInfo = NetworkInfoImpl();
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
  Future<Either<Failure, List<FtxDepositHistory>>> getDeposits() async {
    try {
      return Right(await _ftxWalletRemoteDataSourceImpl.getDepositHistory());
    } on Response catch (e) {
      var failedMessage = e.body;
      return Left(ServerFailure(failedMessage));
    }
  }

  @override
  Future<Either<Failure, List<FtxSubaccount>>> getAllSubaccounts() async {
    if (await _networkInfo.isConnected) {
      try {
        return Right(await _ftxWalletRemoteDataSourceImpl.getAllSubaccounts());
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
  Future<Either<Failure, List<IncomeStatement>>> getIncomeStatement() async {
    if (await _networkInfo.isConnected) {
      try {
        var is1 = IncomeStatement(
            coin: "Edward", totalNetUsd: 100.0, depositUsd: 33.0);
        var is2 = IncomeStatement(
            coin: "Chaiy", totalNetUsd: 990.0, depositUsd: 311.0);

        List incomeStatements = [is1, is2];

        return Right(incomeStatements);
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
  Future<Either<Failure, Map<String, List<FtxCoin>>>> getAllBalances() async {
    try {
      return Right(await _ftxWalletRemoteDataSourceImpl.getAllBalance());
    } on Response catch (e) {
      var failedMessage = e.body;
      return Left(ServerFailure(failedMessage));
    }
  }
}
