import 'package:flutter/cupertino.dart';

@immutable
class LoginModel {
  final String email;
  final String password;

  const LoginModel({
    required this.email,
    required this.password,
  });

  static LoginModel init() {
    return const LoginModel(email: '', password: '');
  }

  LoginModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
