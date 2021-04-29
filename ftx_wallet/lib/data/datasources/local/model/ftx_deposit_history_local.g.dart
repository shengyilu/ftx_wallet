// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftx_deposit_history_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FtxDepositHistoryLocalAdapter
    extends TypeAdapter<FtxDepositHistoryLocal> {
  @override
  FtxDepositHistoryLocal read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FtxDepositHistoryLocal(
      fields[0] as String,
      fields[1] as double,
      fields[2] as String,
      fields[3] as double,
      fields[4] as double,
      fields[5] as String,
      fields[6] as double,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FtxDepositHistoryLocal obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.coin)
      ..writeByte(1)
      ..write(obj.confirmations)
      ..writeByte(2)
      ..write(obj.confirmedTime)
      ..writeByte(3)
      ..write(obj.fee)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.sentTime)
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
  int typeId = 0;
}
