// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playday _$PlaydayFromJson(Map<String, dynamic> json) => Playday(
      date: json['date'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      gallery:
          (json['gallery'] as List<dynamic>).map((e) => e as String).toList(),
      firstLot: Lot.fromJson(json['firstLot'] as Map<String, dynamic>),
      secoundLot: json['secoundLot'] == null
          ? null
          : Lot.fromJson(json['secoundLot'] as Map<String, dynamic>),
      thirdLot: json['thirdLot'] == null
          ? null
          : Lot.fromJson(json['thirdLot'] as Map<String, dynamic>),
      fourthLot: json['fourthLot'] == null
          ? null
          : Lot.fromJson(json['fourthLot'] as Map<String, dynamic>),
      fifthLot: json['fifthLot'] == null
          ? null
          : Lot.fromJson(json['fifthLot'] as Map<String, dynamic>),
      conveniences: (json['conveniences'] as List<dynamic>)
          .map((e) => Convenience.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaydayToJson(Playday instance) => <String, dynamic>{
      'date': instance.date,
      'address': instance.address,
      'firstLot': instance.firstLot,
      'secoundLot': instance.secoundLot,
      'thirdLot': instance.thirdLot,
      'fourthLot': instance.fourthLot,
      'fifthLot': instance.fifthLot,
      'gallery': instance.gallery,
      'conveniences': instance.conveniences,
    };
