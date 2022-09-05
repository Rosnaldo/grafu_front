import 'package:grafu/models/participant.dart';
import 'package:grafu/repositories/participant/response/response_participant.dart';

class ParticipantResponseMapper {
  static Participant toEntity(ResponseParticipant r) {
    return Participant(
      id: r.id,
      name: r.user.name,
      email: r.user.email,
      avatar: r.user.avatar,
      status: mapStatus(r.status),
      age: r.user.age,
      profession: r.user.profession,
    );
  }

  static ParticipantStatus mapStatus(String status) {
    Map<String, ParticipantStatus> map = {
      'pending': ParticipantStatus.pending,
      'confirmed': ParticipantStatus.confirmed,
      'unregistered': ParticipantStatus.unregistered,
    };

    return map[status]!;
  }
}
