// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftx_funding_payment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FtxFundingPayment> _$ftxFundingPaymentSerializer =
    new _$FtxFundingPaymentSerializer();

class _$FtxFundingPaymentSerializer
    implements StructuredSerializer<FtxFundingPayment> {
  @override
  final Iterable<Type> types = const [FtxFundingPayment, _$FtxFundingPayment];
  @override
  final String wireName = 'FtxFundingPayment';

  @override
  Iterable<Object> serialize(Serializers serializers, FtxFundingPayment object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.future != null) {
      result
        ..add('future')
        ..add(serializers.serialize(object.future,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(double)));
    }
    if (object.payment != null) {
      result
        ..add('payment')
        ..add(serializers.serialize(object.payment,
            specifiedType: const FullType(double)));
    }
    if (object.time != null) {
      result
        ..add('time')
        ..add(serializers.serialize(object.time,
            specifiedType: const FullType(String)));
    }
    if (object.rate != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(object.rate,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  FtxFundingPayment deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FtxFundingPaymentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'future':
          result.future = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'payment':
          result.payment = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$FtxFundingPayment extends FtxFundingPayment {
  @override
  final String future;
  @override
  final double id;
  @override
  final double payment;
  @override
  final String time;
  @override
  final double rate;

  factory _$FtxFundingPayment(
          [void Function(FtxFundingPaymentBuilder) updates]) =>
      (new FtxFundingPaymentBuilder()..update(updates)).build();

  _$FtxFundingPayment._(
      {this.future, this.id, this.payment, this.time, this.rate})
      : super._();

  @override
  FtxFundingPayment rebuild(void Function(FtxFundingPaymentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FtxFundingPaymentBuilder toBuilder() =>
      new FtxFundingPaymentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FtxFundingPayment &&
        future == other.future &&
        id == other.id &&
        payment == other.payment &&
        time == other.time &&
        rate == other.rate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, future.hashCode), id.hashCode), payment.hashCode),
            time.hashCode),
        rate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FtxFundingPayment')
          ..add('future', future)
          ..add('id', id)
          ..add('payment', payment)
          ..add('time', time)
          ..add('rate', rate))
        .toString();
  }
}

class FtxFundingPaymentBuilder
    implements Builder<FtxFundingPayment, FtxFundingPaymentBuilder> {
  _$FtxFundingPayment _$v;

  String _future;
  String get future => _$this._future;
  set future(String future) => _$this._future = future;

  double _id;
  double get id => _$this._id;
  set id(double id) => _$this._id = id;

  double _payment;
  double get payment => _$this._payment;
  set payment(double payment) => _$this._payment = payment;

  String _time;
  String get time => _$this._time;
  set time(String time) => _$this._time = time;

  double _rate;
  double get rate => _$this._rate;
  set rate(double rate) => _$this._rate = rate;

  FtxFundingPaymentBuilder();

  FtxFundingPaymentBuilder get _$this {
    if (_$v != null) {
      _future = _$v.future;
      _id = _$v.id;
      _payment = _$v.payment;
      _time = _$v.time;
      _rate = _$v.rate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FtxFundingPayment other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FtxFundingPayment;
  }

  @override
  void update(void Function(FtxFundingPaymentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FtxFundingPayment build() {
    final _$result = _$v ??
        new _$FtxFundingPayment._(
            future: future, id: id, payment: payment, time: time, rate: rate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
