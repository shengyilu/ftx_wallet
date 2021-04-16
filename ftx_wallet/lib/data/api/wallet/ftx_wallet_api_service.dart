import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';

part 'ftx_wallet_api_service.chopper.dart';

@ChopperApi()
abstract class FtxWalletApiService extends ChopperService {
  @Get(path: '/api/wallet/balances')
  Future<Response<BuiltList<FtxCoin>>> getBalance();

  @Get(path: '/api/wallet/balances')
  Future<Response<BuiltList<FtxCoin>>> getBalanceBySubaccount(@Header('FTX-SUBACCOUNT') String subaccount);


  @Get(path: '/api/wallet/deposits')
  Future<Response<BuiltList<FtxDepositHistory>>> getDeposits();

  static FtxWalletApiService create([ChopperClient client]) =>
      _$FtxWalletApiService(client);
}
