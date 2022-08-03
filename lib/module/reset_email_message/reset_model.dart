import 'package:flutter/cupertino.dart';

@immutable
class ResetModel {
  final String email;

  const ResetModel({
    required this.email,
  });

  static ResetModel init() {
    return const ResetModel(email: '');
  }

  ResetModel copyWith({
    String? email,
  }) {
    return ResetModel(
      email: email ?? this.email,
    );
  }
}
