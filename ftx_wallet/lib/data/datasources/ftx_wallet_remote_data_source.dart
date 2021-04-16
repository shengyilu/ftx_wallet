import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:ftx_wallet/data/api/ftx_api_client.dart';
import 'package:ftx_wallet/data/api/subaccounts/ftx_subaccounts_api_service.dart';
import 'package:ftx_wallet/data/api/wallet/ftx_wallet_api_service.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_subaccount.dart';

abstract class FtxWalletRemoteDataSource {
  Future<List<FtxCoin>> fetchBalance();
  Future<List<FtxDepositHistory>> getDepositHistory();
  Future<List<FtxSubaccount>> getAllSubaccounts();
}

class FtxWalletRemoteDataSourceImpl implements FtxWalletRemoteDataSource {
  FtxWalletApiService _ftxWalletApiService;
  FtxSubaccountsApiService _ftxSubaccountsApiService;

  ChopperClient _client;

  FtxWalletRemoteDataSourceImpl() {
    this._client = FtxApiClient.create();

    this._ftxWalletApiService = _client.getService<FtxWalletApiService>();

    this._ftxSubaccountsApiService = _client.getService<FtxSubaccountsApiService>();
  }

  @override
  Future<List<FtxCoin>> fetchBalance() async {
    // Response<BuiltList<FtxCoin>> response =
    //     await _ftxWalletApiService.getBalance();

    Response<BuiltList<FtxCoin>> response =
      await _ftxWalletApiService.getBalanceBySubaccount("BTMX-3");
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

  @override
  Future<List<FtxSubaccount>> getAllSubaccounts() async {
    Response<BuiltList<FtxSubaccount>> response =
        await _ftxSubaccountsApiService.getAllSubaccounts();
    List<FtxSubaccount> ftxSubaccounts = response.body.toList();
    print("[Edward] ftxDeposits:${ftxSubaccounts}");
    return ftxSubaccounts;
  }


}
