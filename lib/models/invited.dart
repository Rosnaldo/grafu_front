const confirmed = 'confirmed';
const pending = 'pending';

enum InvitedStatus {
  confirmed,
  pending,
}

class Invited {
  String name;
  String avatar;
  InvitedStatus status;

  Invited({
    required this.name,
    required this.avatar,
    required this.status,
  });

  static String statusMapper(InvitedStatus status) {
    Map<InvitedStatus, String> map = {
      InvitedStatus.confirmed: 'confirmado',
      InvitedStatus.pending: 'pendente',
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

  factory Invited.fromMap(Map<String, dynamic> map) {
    return Invited(
      name: map['name'] ?? '',
      avatar: map['avatar'] ?? '',
      status: map['status'] ?? InvitedStatus.pending,
    );
  }
}
