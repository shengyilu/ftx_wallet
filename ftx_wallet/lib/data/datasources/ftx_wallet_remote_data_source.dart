import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:ftx_wallet/data/api/ftx_api_client.dart';
import 'package:ftx_wallet/data/api/subaccounts/ftx_subaccounts_api_service.dart';
import 'package:ftx_wallet/data/api/wallet/ftx_wallet_api_service.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_subaccount.dart';
import 'package:ftx_wallet/data/model/serializers.dart';

abstract class FtxWalletRemoteDataSource {
  Future<List<FtxCoin>> getBalance(String subaccount);
  Future<Map<String, List<FtxCoin>>> getAllBalance();
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

    this._ftxSubaccountsApiService =
        _client.getService<FtxSubaccountsApiService>();
  }

  @override
  Future<List<FtxCoin>> getBalance(String subaccount) async {
    Response<BuiltList<FtxCoin>> response =
        await _ftxWalletApiService.getBalance(subaccount);
    List<FtxCoin> ftxCoins = response.body.toList();
    print("[Edward-RemoteDataSource] FtxCoin:${ftxCoins}");
    return ftxCoins;
  }

  @override
  Future<List<FtxDepositHistory>> getDepositHistory() async {
    Response<BuiltList<FtxDepositHistory>> response =
        await _ftxWalletApiService.getDeposits();
    List<FtxDepositHistory> ftxDeposits = response.body.toList();
    print("[Edward-RemoteDataSource] FtxDepositHistory:${ftxDeposits.length}");
    return ftxDeposits;
  }

  @override
  Future<List<FtxSubaccount>> getAllSubaccounts() async {
    Response<BuiltList<FtxSubaccount>> response =
        await _ftxSubaccountsApiService.getAllSubaccounts();
    List<FtxSubaccount> ftxSubaccounts = response.body.toList();
    print("[Edward-RemoteDataSource] FtxSubaccount:${ftxSubaccounts}");
    return ftxSubaccounts;
  }

  @override
  Future<Map<String, List<FtxCoin>>> getAllBalance() async {
    Response<Map<String, dynamic>> response =
        await _ftxWalletApiService.getAllBalances();

    Map<String, List<FtxCoin>> result = Map();
    response.body.forEach((k, v) {
      BuiltList<FtxCoin> ftxCoins = _deserializeListOf<FtxCoin>(v);
      result[k] = ftxCoins.toList();
    });

    return result;
  }

  BuiltList<InnerType> _deserializeListOf<InnerType>(
    List dynamicList,
  ) {
    return BuiltList<InnerType>(
      dynamicList.map((element) => _deserialize<InnerType>(element)),
    );
  }

  InnerType _deserialize<InnerType>(
    Map<String, dynamic> value,
  ) {
    return serializers.deserializeWith<InnerType>(
      serializers.serializerForType(InnerType),
      value,
    );
  }
}
