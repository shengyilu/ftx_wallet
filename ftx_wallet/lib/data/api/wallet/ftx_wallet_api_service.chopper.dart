// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftx_wallet_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$FtxWalletApiService extends FtxWalletApiService {
  _$FtxWalletApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = FtxWalletApiService;

  Future<Response> getBalance() {
    final $url = '/api/wallet/balances';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
