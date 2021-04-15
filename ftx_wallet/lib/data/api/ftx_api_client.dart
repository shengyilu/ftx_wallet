import 'package:chopper/chopper.dart';
import 'package:ftx_wallet/data/api/ftx_data_converter.dart';
import 'package:ftx_wallet/data/api/wallet/ftx_wallet_api_service.dart';

import 'ftx_header_interceptor.dart';

class FtxApiClient {
  static ChopperClient create() {
    final client = ChopperClient(
      baseUrl: 'https://ftx.com',
      services: [
        FtxWalletApiService.create(),
      ],
      errorConverter: FtxDataConverter(),
      converter: FtxDataConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        FtxHeaderInterceptor(),
      ],
    );
    return client;
  }
}
