// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftx_subaccounts_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$FtxSubaccountsApiService extends FtxSubaccountsApiService {
  _$FtxSubaccountsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = FtxSubaccountsApiService;

  Future<Response<BuiltList<FtxSubaccount>>> getAllSubaccounts() {
    final $url = '/api/subaccounts';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<FtxSubaccount>, FtxSubaccount>($request);
  }
}
