import 'package:equatable/equatable.dart';
import 'package:grafu/models/avatar.dart';

enum ParticipantStatus {
  unregistered,
  pending,
  confirmed,
}

class Participant extends Equatable {
  final String id;
  final String email;
  final String name;
  final Avatar? avatar;
  final int? age;
  final String? profession;
  final ParticipantStatus status;

  const Participant({
    required this.id,
    required this.name,
    required this.email,
    required this.status,
    this.avatar,
    this.age,
    this.profession,
  });

  Participant copyWith({
    String? id,
    String? name,
    String? email,
    ParticipantStatus? status,
    Avatar? avatar,
    int? age,
    String? profession,
  }) {
    return Participant(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      status: status ?? this.status,
      age: age ?? this.age,
      profession: profession ?? this.profession,
    );
  }

  static Participant init() {
    return const Participant(
        id: '',
        name: '',
        email: '',
        avatar: Avatar(
          url:
              'https://firebasestorage.googleapis.com/v0/b/grafu-357616.appspot.com/o/avatar-images%2F400bef51-543c-49f3-b3b1-312e02299d6b?alt=media&token=b410801f-8612-4f42-a5ef-a4e9d089eb80',
          uuid: '00bef51-543c-49f3-b3b1-312e02299d6b',
        ),
        status: ParticipantStatus.confirmed);
  }

  static String statusMapper(ParticipantStatus status) {
    Map<ParticipantStatus, String> map = {
      ParticipantStatus.confirmed: 'confirmado',
      ParticipantStatus.pending: 'pendente',
      ParticipantStatus.unregistered: 'unregistered',
    };

    return map[status]!;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        avatar,
        status,
        age,
        profession,
      ];

  @override
  bool get stringify => true;
}
