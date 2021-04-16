
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ftx_subaccount.g.dart';

abstract class FtxSubaccount implements Built<FtxSubaccount, FtxSubaccountBuilder> {

  FtxSubaccount._();
  factory FtxSubaccount([updates(FtxSubaccountBuilder b)]) = _$FtxSubaccount;

  static Serializer<FtxSubaccount> get serializer => _$ftxSubaccountSerializer;

  @nullable
  String get nickname;

  @nullable
  bool get deletable;

  @nullable
  bool get editable;

  @nullable
  bool get competition;

}