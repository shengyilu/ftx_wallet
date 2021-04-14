
import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:ftx_wallet/data/api/wallet/ftx_wallet_api_service.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';

abstract class FtxWalletRemoteDataSource {
  Future<List<FtxCoin>> fetchBalance();
}

class FtxWalletRemoteDataSourceImpl implements FtxWalletRemoteDataSource {

  FtxWalletApiService _ftxWalletApiService;

  FtxWalletRemoteDataSourceImpl() {
    this._ftxWalletApiService = FtxWalletApiService.create();
  }

  @override
  Future<List<FtxCoin>> fetchBalance() async {
    Response<BuiltList<FtxCoin>> response = await _ftxWalletApiService.getBalance();
    List<FtxCoin> ftxCoins = response.body.toList();
    print("[Edward] ftxCoins:${ftxCoins}");
    return ftxCoins;
  }


}