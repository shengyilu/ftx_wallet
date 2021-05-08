import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ftx_funding_payment.g.dart';

abstract class FtxFundingPayment
    implements Built<FtxFundingPayment, FtxFundingPaymentBuilder> {
  FtxFundingPayment._();
  factory FtxFundingPayment([updates(FtxFundingPaymentBuilder b)]) =
      _$FtxFundingPayment;

  static Serializer<FtxFundingPayment> get serializer =>
      _$ftxFundingPaymentSerializer;

  @nullable
  String get future;

  @nullable
  double get id;

  @nullable
  double get payment;

  @nullable
  String get time;

  @nullable
  double get rate;
}
