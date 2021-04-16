import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_subaccount.dart';

part 'ftx_subaccounts_api_service.chopper.dart';

@ChopperApi()
abstract class FtxSubaccountsApiService extends ChopperService {
  @Get(path: '/api/subaccounts')
  Future<Response<BuiltList<FtxSubaccount>>> getAllSubaccounts();


  static FtxSubaccountsApiService create([ChopperClient client]) =>
      _$FtxSubaccountsApiService(client);
}