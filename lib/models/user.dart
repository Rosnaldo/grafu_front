class User {
  String name;
  String email;
  String avatar;

  User({
    required this.name,
    required this.email,
    required this.avatar,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'avatar': avatar,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      avatar: map['avatar'] ?? '',
    );
  }
}
