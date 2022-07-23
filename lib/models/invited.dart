class Invited {
  String name;
  String avatar;
  String status;

  Invited({
    required this.name,
    required this.avatar,
    required this.status,
  });

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
      status: map['status'] ?? '',
    );
  }
}
