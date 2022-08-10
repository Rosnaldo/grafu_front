import 'package:flutter/cupertino.dart';

@immutable
class RegisterModel {
  final String name;
  final String email;
  final int? age;
  final String? profession;
  final String password;
  final String confirm;

  const RegisterModel({
    required this.name,
    required this.email,
    this.age,
    this.profession,
    required this.password,
    required this.confirm,
  });

  static RegisterModel init() {
    return const RegisterModel(name: '', email: '', password: '', confirm: '');
  }

  RegisterModel copyWith({
    String? name,
    String? email,
    int? age,
    String? profession,
    String? password,
    String? confirm,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      profession: profession ?? this.profession,
      password: password ?? this.password,
      confirm: confirm ?? this.confirm,
    );
  }
}
