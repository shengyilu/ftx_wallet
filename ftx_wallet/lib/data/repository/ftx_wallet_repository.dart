
import 'package:chopper/chopper.dart';
import 'package:ftx_wallet/data/api/wallet/ftx_wallet_api_service.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:built_collection/built_collection.dart';

abstract class WalletRepository {
  Future<Response<BuiltList<FtxCoin>>> fetchBalance();
}

class FtxWalletRepository implements WalletRepository {

  FtxWalletApiService _ftxWalletApiService;

  FtxWalletRepository() {
    this._ftxWalletApiService = FtxWalletApiService.create();
  }

  @override
  Future<Response<BuiltList<FtxCoin>>> fetchBalance() {
    return _ftxWalletApiService.getBalance();
  }

}
