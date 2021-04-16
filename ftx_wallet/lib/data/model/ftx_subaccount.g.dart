// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftx_subaccount.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FtxSubaccount> _$ftxSubaccountSerializer =
    new _$FtxSubaccountSerializer();

class _$FtxSubaccountSerializer implements StructuredSerializer<FtxSubaccount> {
  @override
  final Iterable<Type> types = const [FtxSubaccount, _$FtxSubaccount];
  @override
  final String wireName = 'FtxSubaccount';

  @override
  Iterable<Object> serialize(Serializers serializers, FtxSubaccount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.nickname != null) {
      result
        ..add('nickname')
        ..add(serializers.serialize(object.nickname,
            specifiedType: const FullType(String)));
    }
    if (object.deletable != null) {
      result
        ..add('deletable')
        ..add(serializers.serialize(object.deletable,
            specifiedType: const FullType(bool)));
    }
    if (object.editable != null) {
      result
        ..add('editable')
        ..add(serializers.serialize(object.editable,
            specifiedType: const FullType(bool)));
    }
    if (object.competition != null) {
      result
        ..add('competition')
        ..add(serializers.serialize(object.competition,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  FtxSubaccount deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FtxSubaccountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'nickname':
          result.nickname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deletable':
          result.deletable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'editable':
          result.editable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'competition':
          result.competition = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$FtxSubaccount extends FtxSubaccount {
  @override
  final String nickname;
  @override
  final bool deletable;
  @override
  final bool editable;
  @override
  final bool competition;

  factory _$FtxSubaccount([void Function(FtxSubaccountBuilder) updates]) =>
      (new FtxSubaccountBuilder()..update(updates)).build();

  _$FtxSubaccount._(
      {this.nickname, this.deletable, this.editable, this.competition})
      : super._();

  @override
  FtxSubaccount rebuild(void Function(FtxSubaccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FtxSubaccountBuilder toBuilder() => new FtxSubaccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FtxSubaccount &&
        nickname == other.nickname &&
        deletable == other.deletable &&
        editable == other.editable &&
        competition == other.competition;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, nickname.hashCode), deletable.hashCode),
            editable.hashCode),
        competition.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FtxSubaccount')
          ..add('nickname', nickname)
          ..add('deletable', deletable)
          ..add('editable', editable)
          ..add('competition', competition))
        .toString();
  }
}

class FtxSubaccountBuilder
    implements Builder<FtxSubaccount, FtxSubaccountBuilder> {
  _$FtxSubaccount _$v;

  String _nickname;
  String get nickname => _$this._nickname;
  set nickname(String nickname) => _$this._nickname = nickname;

  bool _deletable;
  bool get deletable => _$this._deletable;
  set deletable(bool deletable) => _$this._deletable = deletable;

  bool _editable;
  bool get editable => _$this._editable;
  set editable(bool editable) => _$this._editable = editable;

  bool _competition;
  bool get competition => _$this._competition;
  set competition(bool competition) => _$this._competition = competition;

  FtxSubaccountBuilder();

  FtxSubaccountBuilder get _$this {
    if (_$v != null) {
      _nickname = _$v.nickname;
      _deletable = _$v.deletable;
      _editable = _$v.editable;
      _competition = _$v.competition;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FtxSubaccount other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FtxSubaccount;
  }

  @override
  void update(void Function(FtxSubaccountBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FtxSubaccount build() {
    final _$result = _$v ??
        new _$FtxSubaccount._(
            nickname: nickname,
            deletable: deletable,
            editable: editable,
            competition: competition);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
