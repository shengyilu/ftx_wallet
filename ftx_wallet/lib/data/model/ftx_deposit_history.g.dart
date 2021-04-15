// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftx_deposit_history.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FtxDepositHistory> _$ftxDepositHistorySerializer =
    new _$FtxDepositHistorySerializer();

class _$FtxDepositHistorySerializer
    implements StructuredSerializer<FtxDepositHistory> {
  @override
  final Iterable<Type> types = const [FtxDepositHistory, _$FtxDepositHistory];
  @override
  final String wireName = 'FtxDepositHistory';

  @override
  Iterable<Object> serialize(Serializers serializers, FtxDepositHistory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.coin != null) {
      result
        ..add('coin')
        ..add(serializers.serialize(object.coin,
            specifiedType: const FullType(String)));
    }
    if (object.confirmations != null) {
      result
        ..add('confirmations')
        ..add(serializers.serialize(object.confirmations,
            specifiedType: const FullType(double)));
    }
    if (object.confirmedTime != null) {
      result
        ..add('confirmedTime')
        ..add(serializers.serialize(object.confirmedTime,
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
            specifiedType: const FullType(double)));
    }
    if (object.sentTime != null) {
      result
        ..add('sentTime')
        ..add(serializers.serialize(object.sentTime,
            specifiedType: const FullType(String)));
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
  FtxDepositHistory deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FtxDepositHistoryBuilder();

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
        case 'confirmations':
          result.confirmations = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'confirmedTime':
          result.confirmedTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fee':
          result.fee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'sentTime':
          result.sentTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$FtxDepositHistory extends FtxDepositHistory {
  @override
  final String coin;
  @override
  final double confirmations;
  @override
  final String confirmedTime;
  @override
  final double fee;
  @override
  final double id;
  @override
  final String sentTime;
  @override
  final double size;
  @override
  final String status;
  @override
  final String time;
  @override
  final String txid;

  factory _$FtxDepositHistory(
          [void Function(FtxDepositHistoryBuilder) updates]) =>
      (new FtxDepositHistoryBuilder()..update(updates)).build();

  _$FtxDepositHistory._(
      {this.coin,
      this.confirmations,
      this.confirmedTime,
      this.fee,
      this.id,
      this.sentTime,
      this.size,
      this.status,
      this.time,
      this.txid})
      : super._();

  @override
  FtxDepositHistory rebuild(void Function(FtxDepositHistoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FtxDepositHistoryBuilder toBuilder() =>
      new FtxDepositHistoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FtxDepositHistory &&
        coin == other.coin &&
        confirmations == other.confirmations &&
        confirmedTime == other.confirmedTime &&
        fee == other.fee &&
        id == other.id &&
        sentTime == other.sentTime &&
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
                                        confirmations.hashCode),
                                    confirmedTime.hashCode),
                                fee.hashCode),
                            id.hashCode),
                        sentTime.hashCode),
                    size.hashCode),
                status.hashCode),
            time.hashCode),
        txid.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FtxDepositHistory')
          ..add('coin', coin)
          ..add('confirmations', confirmations)
          ..add('confirmedTime', confirmedTime)
          ..add('fee', fee)
          ..add('id', id)
          ..add('sentTime', sentTime)
          ..add('size', size)
          ..add('status', status)
          ..add('time', time)
          ..add('txid', txid))
        .toString();
  }
}

class FtxDepositHistoryBuilder
    implements Builder<FtxDepositHistory, FtxDepositHistoryBuilder> {
  _$FtxDepositHistory _$v;

  String _coin;
  String get coin => _$this._coin;
  set coin(String coin) => _$this._coin = coin;

  double _confirmations;
  double get confirmations => _$this._confirmations;
  set confirmations(double confirmations) =>
      _$this._confirmations = confirmations;

  String _confirmedTime;
  String get confirmedTime => _$this._confirmedTime;
  set confirmedTime(String confirmedTime) =>
      _$this._confirmedTime = confirmedTime;

  double _fee;
  double get fee => _$this._fee;
  set fee(double fee) => _$this._fee = fee;

  double _id;
  double get id => _$this._id;
  set id(double id) => _$this._id = id;

  String _sentTime;
  String get sentTime => _$this._sentTime;
  set sentTime(String sentTime) => _$this._sentTime = sentTime;

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

  FtxDepositHistoryBuilder();

  FtxDepositHistoryBuilder get _$this {
    if (_$v != null) {
      _coin = _$v.coin;
      _confirmations = _$v.confirmations;
      _confirmedTime = _$v.confirmedTime;
      _fee = _$v.fee;
      _id = _$v.id;
      _sentTime = _$v.sentTime;
      _size = _$v.size;
      _status = _$v.status;
      _time = _$v.time;
      _txid = _$v.txid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FtxDepositHistory other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FtxDepositHistory;
  }

  @override
  void update(void Function(FtxDepositHistoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FtxDepositHistory build() {
    final _$result = _$v ??
        new _$FtxDepositHistory._(
            coin: coin,
            confirmations: confirmations,
            confirmedTime: confirmedTime,
            fee: fee,
            id: id,
            sentTime: sentTime,
            size: size,
            status: status,
            time: time,
            txid: txid);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
