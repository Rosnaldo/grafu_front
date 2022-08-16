import 'package:grafu/models/participant.dart';
import 'package:grafu/repositories/participant/response_participant.dart';

class ParticipantResponseMapper {
  static Participant toEntity(ResponseParticipant r) {
    return Participant(
      id: r.id,
      avatar: r.user.avatar,
      name: r.user.name,
      status: mapStatus(r.status),
      age: r.user.age,
      profession: r.user.profession,
    );
  }

  static ParticipantStatus mapStatus(String status) {
    Map<String, ParticipantStatus> map = {
      'pending': ParticipantStatus.pending,
      'confirmed': ParticipantStatus.pending,
    };

    return map[status]!;
  }
}
