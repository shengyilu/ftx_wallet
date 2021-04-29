import 'package:hive/hive.dart';

part 'ftx_withdrawal_history_local.g.dart';

@HiveType(typeId : 1)
class FtxWithdrawalHistoryLocal {

  FtxWithdrawalHistoryLocal(
      this.coin,
      this.address,
      this.confirmedTime,
      this.tag,
      this.fee,
      this.id,
      this.size,
      this.status,
      this.time,
      this.txid,
      );

  @HiveField(0)
  final String coin;

  @HiveField(1)
  final String address;

  @HiveField(2)
  final String confirmedTime;

  @HiveField(3)
  final String tag;

  @HiveField(4)
  final double fee;

  @HiveField(5)
  final int id;

  @HiveField(6)
  final double size;

  @HiveField(7)
  final String status;

  @HiveField(8)
  final String time;

  @HiveField(9)
  final String txid;
}