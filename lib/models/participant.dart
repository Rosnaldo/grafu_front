import 'package:json_annotation/json_annotation.dart';
part 'participant.g.dart';

enum ParticipantStatus {
  confirmed,
  pending,
}

@JsonSerializable()
class Participant {
  String name;
  String avatar;
  ParticipantStatus status;

  Participant({
    required this.name,
    required this.avatar,
    required this.status,
  });

  static String statusMapper(ParticipantStatus status) {
    Map<ParticipantStatus, String> map = {
      ParticipantStatus.confirmed: 'confirmado',
      ParticipantStatus.pending: 'pendente',
    };

    return map[status]!;
  }

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantToJson(this);
}
