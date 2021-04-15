import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ftx_deposit_history.g.dart';

abstract class FtxDepositHistory
    implements Built<FtxDepositHistory, FtxDepositHistoryBuilder> {
  FtxDepositHistory._();
  factory FtxDepositHistory([updates(FtxDepositHistoryBuilder b)]) =
      _$FtxDepositHistory;

  static Serializer<FtxDepositHistory> get serializer =>
      _$ftxDepositHistorySerializer;

  @nullable
  String get coin;

  @nullable
  double get confirmations;

  @nullable
  String get confirmedTime;

  @nullable
  double get fee;

  @nullable
  double get id;

  @nullable
  String get sentTime;

  @nullable
  double get size;

  @nullable
  String get status;

  @nullable
  String get time;

  @nullable
  String get txid;
}
