import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_funding_payment.dart';
import 'package:ftx_wallet/data/model/ftx_withdrawal_history.dart';

part 'ftx_wallet_api_service.chopper.dart';

@ChopperApi()
abstract class FtxWalletApiService extends ChopperService {
  @Get(path: '/api/wallet/balances')
  Future<Response<BuiltList<FtxCoin>>> getBalance(
      @Header('FTX-SUBACCOUNT') String subaccount);

  @Get(path: '/api/wallet/all_balances')
  Future<Response<Map<String, dynamic>>> getAllBalances();

  @Get(path: '/api/wallet/deposits')
  Future<Response<BuiltList<FtxDepositHistory>>> getDeposits(
      @Header('FTX-SUBACCOUNT') String subaccount);

  @Get(path: '/api/wallet/withdrawals')
  Future<Response<BuiltList<FtxWithdrawalHistory>>> getWithdrawals(
      @Header('FTX-SUBACCOUNT') String subaccount);

  @Get(path: '/api/funding_payments')
  Future<Response<BuiltList<FtxFundingPayment>>> getFundingPayment(
      @Header('FTX-SUBACCOUNT') String subaccount);

  static FtxWalletApiService create([ChopperClient client]) =>
      _$FtxWalletApiService(client);
}
