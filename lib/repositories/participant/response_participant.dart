import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:grafu/repositories/serializers/serializers.dart';
import 'package:grafu/repositories/user/response_user.dart';

part 'response_participant.g.dart';

abstract class ResponseParticipant
    implements Built<ResponseParticipant, ResponseParticipantBuilder> {
  static Serializer<ResponseParticipant> get serializer =>
      _$responseParticipantSerializer;

  String get id;
  ResponseUser get user;
  String get status;

  ResponseParticipant._();

  factory ResponseParticipant(
          [void Function(ResponseParticipantBuilder) updates]) =
      _$ResponseParticipant;

  String toJson() {
    return json.encode(
        serializers.serializeWith(ResponseParticipant.serializer, this));
  }

  static ResponseParticipant fromJson(String jsonString) {
    return serializers.deserializeWith(
        ResponseParticipant.serializer, json.decode(jsonString))!;
  }
}
