const confirmed = 'confirmed';
const pending = 'pending';

enum MemberStatus {
  confirmed,
  pending,
}

class Member {
  String name;
  String avatar;
  MemberStatus status;

  Member({
    required this.name,
    required this.avatar,
    required this.status,
  });

  static String statusMapper(MemberStatus status) {
    Map<MemberStatus, String> map = {
      MemberStatus.confirmed: 'confirmado',
      MemberStatus.pending: 'pendente',
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

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      name: map['name'] ?? '',
      avatar: map['avatar'] ?? '',
      status: map['status'] ?? MemberStatus.pending,
    );
  }
}
