import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:ftx_wallet/data/api/ftx_api_client.dart';
import 'package:ftx_wallet/data/api/wallet/ftx_wallet_api_service.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';

abstract class FtxWalletRemoteDataSource {
  Future<List<FtxCoin>> fetchBalance();
  Future<List<FtxDepositHistory>> getDepositHistory();
}

class FtxWalletRemoteDataSourceImpl implements FtxWalletRemoteDataSource {
  FtxWalletApiService _ftxWalletApiService;

  ChopperClient _client;

  FtxWalletRemoteDataSourceImpl() {
    this._client = FtxApiClient.create();

    this._ftxWalletApiService = _client.getService<FtxWalletApiService>();
  }

  @override
  Future<List<FtxCoin>> fetchBalance() async {
    Response<BuiltList<FtxCoin>> response =
        await _ftxWalletApiService.getBalance();
    List<FtxCoin> ftxCoins = response.body.toList();
    print("[Edward] ftxCoins:${ftxCoins}");
    return ftxCoins;
  }

  @override
  Future<List<FtxDepositHistory>> getDepositHistory() async {
    Response<BuiltList<FtxDepositHistory>> response =
        await _ftxWalletApiService.getDeposits();
    List<FtxDepositHistory> ftxDeposits = response.body.toList();
    print("[Edward] ftxDeposits:${ftxDeposits}");
    return ftxDeposits;
  }
}
