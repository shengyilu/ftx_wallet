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

  Future<Response<BuiltList<FtxCoin>>> getBalance(String subaccount) {
    final $url = '/api/wallet/balances';
    final $headers = {'FTX-SUBACCOUNT': subaccount};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<BuiltList<FtxCoin>, FtxCoin>($request);
  }

  Future<Response<Map<String, dynamic>>> getAllBalances() {
    final $url = '/api/wallet/all_balances';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  Future<Response<BuiltList<FtxDepositHistory>>> getDeposits(
      String subaccount) {
    final $url = '/api/wallet/deposits';
    final $headers = {'FTX-SUBACCOUNT': subaccount};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<BuiltList<FtxDepositHistory>, FtxDepositHistory>($request);
  }

  Future<Response<BuiltList<FtxWithdrawalHistory>>> getWithdrawals(
      String subaccount) {
    final $url = '/api/wallet/withdrawals';
    final $headers = {'FTX-SUBACCOUNT': subaccount};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<BuiltList<FtxWithdrawalHistory>, FtxWithdrawalHistory>($request);
  }
}
