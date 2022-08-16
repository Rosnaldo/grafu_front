import 'package:equatable/equatable.dart';
import 'package:grafu/models/playday.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String avatar;
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

  @override
  List<Object?> get props =>
      [id, name, email, avatar, age, profession, adminPlayday];

  @override
  bool get stringify => true;
}
