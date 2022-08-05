const confirmed = 'confirmed';
const pending = 'pending';

enum ParticipantStatus {
  confirmed,
  pending,
}

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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatar': avatar,
      'status': status,
    };
  }

  factory Participant.fromMap(Map<String, dynamic> map) {
    return Participant(
      name: map['name'] ?? '',
      avatar: map['avatar'] ?? '',
      status: map['status'] ?? ParticipantStatus.pending,
    );
  }
}
