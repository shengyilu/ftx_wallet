// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftx_withdrawal_history_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FtxWithdrawalHistoryLocalAdapter
    extends TypeAdapter<FtxWithdrawalHistoryLocal> {
  @override
  FtxWithdrawalHistoryLocal read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FtxWithdrawalHistoryLocal(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as double,
      fields[5] as int,
      fields[6] as double,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FtxWithdrawalHistoryLocal obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.coin)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.confirmedTime)
      ..writeByte(3)
      ..write(obj.tag)
      ..writeByte(4)
      ..write(obj.fee)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.size)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.time)
      ..writeByte(9)
      ..write(obj.txid);
  }

  @override
  // TODO: implement typeId
  int typeId = 1;
}
