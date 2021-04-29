import 'package:hive/hive.dart';

part 'ftx_deposit_history_local.g.dart';

@HiveType(typeId : 0)
class FtxDepositHistoryLocal {

  FtxDepositHistoryLocal(
      this.coin,
      this.confirmations,
      this.confirmedTime,
      this.fee,
      this.id,
      this.sentTime,
      this.size,
      this.status,
      this.time,
      this.txid
      );

  @HiveField(0)
  final String coin;

  @HiveField(1)
  final double confirmations;

  @HiveField(2)
  final String confirmedTime;

  @HiveField(3)
  final double fee;

  @HiveField(4)
  final double id;

  @HiveField(5)
  final String sentTime;

  @HiveField(6)
  final double size;

  @HiveField(7)
  final String status;

  @HiveField(8)
  final String time;

  @HiveField(9)
  final String txid;
}