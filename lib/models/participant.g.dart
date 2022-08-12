// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Participant _$ParticipantFromJson(Map<String, dynamic> json) => Participant(
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      status: $enumDecode(_$ParticipantStatusEnumMap, json['status']),
      age: json['age'] as int?,
      profession: json['profession'] as String?,
    );

Map<String, dynamic> _$ParticipantToJson(Participant instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'age': instance.age,
      'profession': instance.profession,
      'status': _$ParticipantStatusEnumMap[instance.status]!,
    };

const _$ParticipantStatusEnumMap = {
  ParticipantStatus.confirmed: 'confirmed',
  ParticipantStatus.pending: 'pending',
};
