import 'package:chopper/chopper.dart';
import 'package:ftx_wallet/data/api/ftx_data_converter.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:built_collection/built_collection.dart';
import '../ftx_header_interceptor.dart';

part 'ftx_wallet_api_service.chopper.dart';

@ChopperApi()
abstract class FtxWalletApiService extends ChopperService {

  @Get(path:'/api/wallet/balances')
  Future<Response<BuiltList<FtxCoin>>> getBalance();

  static FtxWalletApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://ftx.com',
      services: [
        _$FtxWalletApiService(),
      ],
      converter: FtxDataConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        FtxHeaderInterceptor(),
      ],
    );
    return _$FtxWalletApiService(client);
  }

}