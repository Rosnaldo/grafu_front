import 'package:grafu/models/playday.dart';
import 'package:json_annotation/json_annotation.dart';

class User {
  String id;
  String name;
  String email;
  String avatar;
  int? age;
  String? profession;
  @JsonKey(name: 'AdminPlayday')
  List<Playday>? adminPlayday = [];

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    this.age,
    this.profession,
    this.adminPlayday,
  });
}
