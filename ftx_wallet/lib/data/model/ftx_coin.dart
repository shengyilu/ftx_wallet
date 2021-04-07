
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ftx_coin.g.dart';

abstract class FtxCoin implements Built<FtxCoin, FtxCoinBuilder> {

  FtxCoin._();
  factory FtxCoin([updates(FtxCoinBuilder b)]) = _$FtxCoin;

  static Serializer<FtxCoin> get serializer => _$ftxCoinSerializer;

  @nullable
  String get coin;

  @nullable
  double get total;

  @nullable
  double get free;

  @nullable
  double get availableWithoutBorrow;

  @nullable
  double get usdValue;

  @nullable
  double get spotBorrow;
}