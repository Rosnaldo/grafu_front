import 'package:flutter/cupertino.dart';

@immutable
class RegisterModel {
  final String name;
  final String email;
  final String password;
  final String confirm;

  const RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirm,
  });

  static RegisterModel init() {
    return const RegisterModel(name: '', email: '', password: '', confirm: '');
  }

  RegisterModel copyWith({
    String? name,
    String? email,
    String? password,
    String? confirm,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirm: confirm ?? this.confirm,
    );
  }
}
