import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_withdrawal_history.dart';
import 'ftx_subaccount.dart';

part 'serializers.g.dart';

@SerializersFor([
  FtxCoin,
  FtxDepositHistory,
  FtxSubaccount,
  FtxWithdrawalHistory
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
