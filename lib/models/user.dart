import 'package:equatable/equatable.dart';
import 'package:grafu/models/avatar.dart';
import 'package:grafu/models/playday.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final Avatar? avatar;
  final int? age;
  final String? profession;
  final List<Playday>? adminPlayday;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    this.age,
    this.profession,
    this.adminPlayday,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    Avatar? avatar,
    int? age,
    String? profession,
    List<Playday>? adminPlayday,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      age: age ?? this.age,
      profession: profession ?? this.profession,
      adminPlayday: adminPlayday ?? this.adminPlayday,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, email, avatar, age, profession, adminPlayday];

  @override
  bool get stringify => true;
}
