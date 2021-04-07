import 'package:chopper/chopper.dart';
import 'package:ftx_wallet/data/api/ftx_data_converter.dart';

import '../ftx_header_interceptor.dart';

part 'ftx_wallet_api_service.chopper.dart';

@ChopperApi()
abstract class FtxWalletApiService extends ChopperService {

  @Get(path:'/api/wallet/balances')
  Future<Response> getBalance();

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