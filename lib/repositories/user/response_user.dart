import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:grafu/repositories/serializers/serializers.dart';

part 'response_user.g.dart';

abstract class ResponseUser
    implements Built<ResponseUser, ResponseUserBuilder> {
  static Serializer<ResponseUser> get serializer => _$responseUserSerializer;

  String get id;
  String get name;
  String get email;
  String? get avatar;
  int? get age;
  String? get profession;

  ResponseUser._();

  factory ResponseUser([void Function(ResponseUserBuilder) updates]) =
      _$ResponseUser;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ResponseUser.serializer, this));
  }

  static ResponseUser fromJson(String jsonString) {
    return serializers.deserializeWith(
        ResponseUser.serializer, json.decode(jsonString))!;
  }
}
