// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convenience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Convenience _$ConvenienceFromJson(Map<String, dynamic> json) => Convenience(
      type: $enumDecode(_$ConvenienceTypeEnumMap, json['type']),
      items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ConvenienceToJson(Convenience instance) =>
    <String, dynamic>{
      'type': _$ConvenienceTypeEnumMap[instance.type]!,
      'items': instance.items,
    };

const _$ConvenienceTypeEnumMap = {
  ConvenienceType.park: 'park',
  ConvenienceType.food: 'food',
  ConvenienceType.internet: 'internet',
  ConvenienceType.sleep: 'sleep',
  ConvenienceType.parking: 'parking',
  ConvenienceType.pool: 'pool',
  ConvenienceType.notFound: 'notFound',
};
