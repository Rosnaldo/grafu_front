import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:grafu/repositories/participant/response_participant.dart';
import 'package:grafu/repositories/serializers/serializers.dart';

part 'response_playday.g.dart';

abstract class ResponsePlayday
    implements Built<ResponsePlayday, ResponsePlaydayBuilder> {
  static Serializer<ResponsePlayday> get serializer =>
      _$responsePlaydaySerializer;

  String get id;
  String get date;
  String get adminId;

  @BuiltValueField(wireName: 'address_district')
  String get addressDistrict;
  @BuiltValueField(wireName: 'address_street')
  String get addressStreet;
  @BuiltValueField(wireName: 'address_city')
  String get addressCity;
  @BuiltValueField(wireName: 'address_state')
  String get addressState;

  @BuiltValueField(wireName: 'lot1_price')
  int get lot1Price;
  @BuiltValueField(wireName: 'lot1_vacancy_existent')
  int get lot1VacancyExistent;
  @BuiltValueField(wireName: 'lot1_vacancy_filled')
  int get lot1VacancyFilled;

  @BuiltValueField(wireName: 'lot2_price')
  int? get lot2Price;
  @BuiltValueField(wireName: 'lot2_vacancy_existent')
  int? get lot2VacancyExistent;
  @BuiltValueField(wireName: 'lot2_vacancy_filled')
  int? get lot2VacancyFilled;

  @BuiltValueField(wireName: 'lot3_price')
  int? get lot3Price;
  @BuiltValueField(wireName: 'lot3_vacancy_existent')
  int? get lot3VacancyExistent;
  @BuiltValueField(wireName: 'lot3_vacancy_filled')
  int? get lot3VacancyFilled;

  @BuiltValueField(wireName: 'lot4_price')
  int? get lot4Price;
  @BuiltValueField(wireName: 'lot4_vacancy_existent')
  int? get lot4VacancyExistent;
  @BuiltValueField(wireName: 'lot4_vacancy_filled')
  int? get lot4VacancyFilled;

  @BuiltValueField(wireName: 'lot5_price')
  int? get lot5Price;
  @BuiltValueField(wireName: 'lot5_vacancy_existent')
  int? get lot5VacancyExistent;
  @BuiltValueField(wireName: 'lot5_vacancy_filled')
  int? get lot5VacancyFilled;

  BuiltList<String> get gallery;

  @BuiltValueField(wireName: 'convenience_park')
  BuiltList<String> get conveniencePark;
  @BuiltValueField(wireName: 'convenience_food')
  BuiltList<String> get convenienceFood;
  @BuiltValueField(wireName: 'convenience_internet')
  BuiltList<String> get convenienceInternet;
  @BuiltValueField(wireName: 'convenience_sleep')
  BuiltList<String> get convenienceSleep;
  @BuiltValueField(wireName: 'convenience_parking')
  BuiltList<String> get convenienceParking;
  @BuiltValueField(wireName: 'convenience_pool')
  BuiltList<String> get conveniencePool;

  BuiltList<ResponseParticipant> get participants;

  ResponsePlayday._();

  factory ResponsePlayday([void Function(ResponsePlaydayBuilder) updates]) =
      _$ResponsePlayday;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ResponsePlayday.serializer, this));
  }

  static ResponsePlayday fromJson(String jsonString) {
    return serializers.deserializeWith(
        ResponsePlayday.serializer, json.decode(jsonString))!;
  }
}
