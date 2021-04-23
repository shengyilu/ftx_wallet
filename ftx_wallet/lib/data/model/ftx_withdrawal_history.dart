import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ftx_withdrawal_history.g.dart';

abstract class FtxWithdrawalHistory
    implements Built<FtxWithdrawalHistory, FtxWithdrawalHistoryBuilder> {


  FtxWithdrawalHistory._();
  factory FtxWithdrawalHistory([updates(FtxWithdrawalHistoryBuilder b)]) =
  _$FtxWithdrawalHistory;

  static Serializer<FtxWithdrawalHistory> get serializer =>
      _$ftxWithdrawalHistorySerializer;


  @nullable
  String get coin;

  @nullable
  String get address;

  @nullable
  String get confirmedTime;

  @nullable
  String get tag;

  @nullable
  double get fee;

  @nullable
  int get id;

  @nullable
  double get size;

  @nullable
  String get status;

  @nullable
  String get time;

  @nullable
  String get txid;


}