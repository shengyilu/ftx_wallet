
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:ftx_wallet/data/model/serializers.dart';

class FtxDataConverter extends JsonConverter {

  @override
  Response convertError<BodyType, InnerType>(Response response) {
    final Response dynamicResponse = super.convertError(response);
    Map<String, dynamic> content = jsonDecode(dynamicResponse.bodyString);

    return dynamicResponse.replace<String>(body: content['error']);
  }


  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(
      Response response) {
    final Response dynamicResponse = super.convertResponse(response);

    Map<String, dynamic> content = jsonDecode(dynamicResponse.bodyString);

    final BodyType customBody =
      _convertToCustomObject<InnerType>(content['result']);

    return dynamicResponse.replace<BodyType>(body: customBody);

  }

  dynamic _convertToCustomObject<InnerType>(dynamic element) {

    if (element is InnerType) return element;

    if (element is List)
      return _deserializeListOf<InnerType>(element);
    else
      return _deserialize<InnerType>(element);
  }

  BuiltList<InnerType> _deserializeListOf<InnerType>(
      List dynamicList,
      ) {

    return BuiltList<InnerType>(
      dynamicList.map((element) => _deserialize<InnerType>(element)),
    );
  }

  InnerType _deserialize<InnerType>(
      Map<String, dynamic> value,
      ) {

    return serializers.deserializeWith<InnerType>(
      serializers.serializerForType(InnerType),
      value,
    );
  }
}