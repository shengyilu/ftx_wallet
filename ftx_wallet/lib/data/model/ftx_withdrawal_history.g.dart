// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftx_withdrawal_history.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FtxWithdrawalHistory> _$ftxWithdrawalHistorySerializer =
    new _$FtxWithdrawalHistorySerializer();

class _$FtxWithdrawalHistorySerializer
    implements StructuredSerializer<FtxWithdrawalHistory> {
  @override
  final Iterable<Type> types = const [
    FtxWithdrawalHistory,
    _$FtxWithdrawalHistory
  ];
  @override
  final String wireName = 'FtxWithdrawalHistory';

  @override
  Iterable<Object> serialize(
      Serializers serializers, FtxWithdrawalHistory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.coin != null) {
      result
        ..add('coin')
        ..add(serializers.serialize(object.coin,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.confirmedTime != null) {
      result
        ..add('confirmedTime')
        ..add(serializers.serialize(object.confirmedTime,
            specifiedType: const FullType(String)));
    }
    if (object.tag != null) {
      result
        ..add('tag')
        ..add(serializers.serialize(object.tag,
            specifiedType: const FullType(String)));
    }
    if (object.fee != null) {
      result
        ..add('fee')
        ..add(serializers.serialize(object.fee,
            specifiedType: const FullType(double)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.size != null) {
      result
        ..add('size')
        ..add(serializers.serialize(object.size,
            specifiedType: const FullType(double)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.time != null) {
      result
        ..add('time')
        ..add(serializers.serialize(object.time,
            specifiedType: const FullType(String)));
    }
    if (object.txid != null) {
      result
        ..add('txid')
        ..add(serializers.serialize(object.txid,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  FtxWithdrawalHistory deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FtxWithdrawalHistoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'coin':
          result.coin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'confirmedTime':
          result.confirmedTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tag':
          result.tag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fee':
          result.fee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'txid':
          result.txid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FtxWithdrawalHistory extends FtxWithdrawalHistory {
  @override
  final String coin;
  @override
  final String address;
  @override
  final String confirmedTime;
  @override
  final String tag;
  @override
  final double fee;
  @override
  final int id;
  @override
  final double size;
  @override
  final String status;
  @override
  final String time;
  @override
  final String txid;

  factory _$FtxWithdrawalHistory(
          [void Function(FtxWithdrawalHistoryBuilder) updates]) =>
      (new FtxWithdrawalHistoryBuilder()..update(updates)).build();

  _$FtxWithdrawalHistory._(
      {this.coin,
      this.address,
      this.confirmedTime,
      this.tag,
      this.fee,
      this.id,
      this.size,
      this.status,
      this.time,
      this.txid})
      : super._();

  @override
  FtxWithdrawalHistory rebuild(
          void Function(FtxWithdrawalHistoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FtxWithdrawalHistoryBuilder toBuilder() =>
      new FtxWithdrawalHistoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FtxWithdrawalHistory &&
        coin == other.coin &&
        address == other.address &&
        confirmedTime == other.confirmedTime &&
        tag == other.tag &&
        fee == other.fee &&
        id == other.id &&
        size == other.size &&
        status == other.status &&
        time == other.time &&
        txid == other.txid;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, coin.hashCode),
                                        address.hashCode),
                                    confirmedTime.hashCode),
                                tag.hashCode),
                            fee.hashCode),
                        id.hashCode),
                    size.hashCode),
                status.hashCode),
            time.hashCode),
        txid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FtxWithdrawalHistory')
          ..add('coin', coin)
          ..add('address', address)
          ..add('confirmedTime', confirmedTime)
          ..add('tag', tag)
          ..add('fee', fee)
          ..add('id', id)
          ..add('size', size)
          ..add('status', status)
          ..add('time', time)
          ..add('txid', txid))
        .toString();
  }
}

class FtxWithdrawalHistoryBuilder
    implements Builder<FtxWithdrawalHistory, FtxWithdrawalHistoryBuilder> {
  _$FtxWithdrawalHistory _$v;

  String _coin;
  String get coin => _$this._coin;
  set coin(String coin) => _$this._coin = coin;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _confirmedTime;
  String get confirmedTime => _$this._confirmedTime;
  set confirmedTime(String confirmedTime) =>
      _$this._confirmedTime = confirmedTime;

  String _tag;
  String get tag => _$this._tag;
  set tag(String tag) => _$this._tag = tag;

  double _fee;
  double get fee => _$this._fee;
  set fee(double fee) => _$this._fee = fee;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  double _size;
  double get size => _$this._size;
  set size(double size) => _$this._size = size;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _time;
  String get time => _$this._time;
  set time(String time) => _$this._time = time;

  String _txid;
  String get txid => _$this._txid;
  set txid(String txid) => _$this._txid = txid;

  FtxWithdrawalHistoryBuilder();

  FtxWithdrawalHistoryBuilder get _$this {
    if (_$v != null) {
      _coin = _$v.coin;
      _address = _$v.address;
      _confirmedTime = _$v.confirmedTime;
      _tag = _$v.tag;
      _fee = _$v.fee;
      _id = _$v.id;
      _size = _$v.size;
      _status = _$v.status;
      _time = _$v.time;
      _txid = _$v.txid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FtxWithdrawalHistory other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FtxWithdrawalHistory;
  }

  @override
  void update(void Function(FtxWithdrawalHistoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FtxWithdrawalHistory build() {
    final _$result = _$v ??
        new _$FtxWithdrawalHistory._(
            coin: coin,
            address: address,
            confirmedTime: confirmedTime,
            tag: tag,
            fee: fee,
            id: id,
            size: size,
            status: status,
            time: time,
            txid: txid);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
