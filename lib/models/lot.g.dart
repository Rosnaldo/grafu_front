// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lot _$LotFromJson(Map<String, dynamic> json) => Lot(
      price: (json['price'] as num).toDouble(),
      vacancyExistent: json['vacancyExistent'] as int,
      vacancyFilled: json['vacancyFilled'] as int,
    );

Map<String, dynamic> _$LotToJson(Lot instance) => <String, dynamic>{
      'price': instance.price,
      'vacancyExistent': instance.vacancyExistent,
      'vacancyFilled': instance.vacancyFilled,
    };
