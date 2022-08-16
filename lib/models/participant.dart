enum ParticipantStatus {
  confirmed,
  pending,
}

class Participant {
  String id;
  String name;
  String avatar;
  int? age;
  String? profession;
  ParticipantStatus status;

  Participant({
    required this.id,
    required this.name,
    required this.avatar,
    required this.status,
    this.age,
    this.profession,
  });

  static Participant init() {
    return Participant(
        id: '',
        name: '',
        avatar:
            'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
        status: ParticipantStatus.confirmed);
  }

  static String statusMapper(ParticipantStatus status) {
    Map<ParticipantStatus, String> map = {
      ParticipantStatus.confirmed: 'confirmado',
      ParticipantStatus.pending: 'pendente',
    };

    return map[status]!;
  }
}
