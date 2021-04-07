// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftx_coin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FtxCoin> _$ftxCoinSerializer = new _$FtxCoinSerializer();

class _$FtxCoinSerializer implements StructuredSerializer<FtxCoin> {
  @override
  final Iterable<Type> types = const [FtxCoin, _$FtxCoin];
  @override
  final String wireName = 'FtxCoin';

  @override
  Iterable<Object> serialize(Serializers serializers, FtxCoin object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.coin != null) {
      result
        ..add('coin')
        ..add(serializers.serialize(object.coin,
            specifiedType: const FullType(String)));
    }
    if (object.total != null) {
      result
        ..add('total')
        ..add(serializers.serialize(object.total,
            specifiedType: const FullType(double)));
    }
    if (object.free != null) {
      result
        ..add('free')
        ..add(serializers.serialize(object.free,
            specifiedType: const FullType(double)));
    }
    if (object.availableWithoutBorrow != null) {
      result
        ..add('availableWithoutBorrow')
        ..add(serializers.serialize(object.availableWithoutBorrow,
            specifiedType: const FullType(double)));
    }
    if (object.usdValue != null) {
      result
        ..add('usdValue')
        ..add(serializers.serialize(object.usdValue,
            specifiedType: const FullType(double)));
    }
    if (object.spotBorrow != null) {
      result
        ..add('spotBorrow')
        ..add(serializers.serialize(object.spotBorrow,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  FtxCoin deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FtxCoinBuilder();

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
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'free':
          result.free = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'availableWithoutBorrow':
          result.availableWithoutBorrow = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'usdValue':
          result.usdValue = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'spotBorrow':
          result.spotBorrow = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$FtxCoin extends FtxCoin {
  @override
  final String coin;
  @override
  final double total;
  @override
  final double free;
  @override
  final double availableWithoutBorrow;
  @override
  final double usdValue;
  @override
  final double spotBorrow;

  factory _$FtxCoin([void Function(FtxCoinBuilder) updates]) =>
      (new FtxCoinBuilder()..update(updates)).build();

  _$FtxCoin._(
      {this.coin,
      this.total,
      this.free,
      this.availableWithoutBorrow,
      this.usdValue,
      this.spotBorrow})
      : super._();

  @override
  FtxCoin rebuild(void Function(FtxCoinBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FtxCoinBuilder toBuilder() => new FtxCoinBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FtxCoin &&
        coin == other.coin &&
        total == other.total &&
        free == other.free &&
        availableWithoutBorrow == other.availableWithoutBorrow &&
        usdValue == other.usdValue &&
        spotBorrow == other.spotBorrow;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, coin.hashCode), total.hashCode), free.hashCode),
                availableWithoutBorrow.hashCode),
            usdValue.hashCode),
        spotBorrow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FtxCoin')
          ..add('coin', coin)
          ..add('total', total)
          ..add('free', free)
          ..add('availableWithoutBorrow', availableWithoutBorrow)
          ..add('usdValue', usdValue)
          ..add('spotBorrow', spotBorrow))
        .toString();
  }
}

class FtxCoinBuilder implements Builder<FtxCoin, FtxCoinBuilder> {
  _$FtxCoin _$v;

  String _coin;
  String get coin => _$this._coin;
  set coin(String coin) => _$this._coin = coin;

  double _total;
  double get total => _$this._total;
  set total(double total) => _$this._total = total;

  double _free;
  double get free => _$this._free;
  set free(double free) => _$this._free = free;

  double _availableWithoutBorrow;
  double get availableWithoutBorrow => _$this._availableWithoutBorrow;
  set availableWithoutBorrow(double availableWithoutBorrow) =>
      _$this._availableWithoutBorrow = availableWithoutBorrow;

  double _usdValue;
  double get usdValue => _$this._usdValue;
  set usdValue(double usdValue) => _$this._usdValue = usdValue;

  double _spotBorrow;
  double get spotBorrow => _$this._spotBorrow;
  set spotBorrow(double spotBorrow) => _$this._spotBorrow = spotBorrow;

  FtxCoinBuilder();

  FtxCoinBuilder get _$this {
    if (_$v != null) {
      _coin = _$v.coin;
      _total = _$v.total;
      _free = _$v.free;
      _availableWithoutBorrow = _$v.availableWithoutBorrow;
      _usdValue = _$v.usdValue;
      _spotBorrow = _$v.spotBorrow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FtxCoin other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FtxCoin;
  }

  @override
  void update(void Function(FtxCoinBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FtxCoin build() {
    final _$result = _$v ??
        new _$FtxCoin._(
            coin: coin,
            total: total,
            free: free,
            availableWithoutBorrow: availableWithoutBorrow,
            usdValue: usdValue,
            spotBorrow: spotBorrow);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
