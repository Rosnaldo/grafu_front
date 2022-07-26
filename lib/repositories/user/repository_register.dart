import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:grafu/repositories/user/mapper.dart';

class UserRegisterRepository {
  Future<void> execute({
    required String email,
    required String name,
    String? avatarUrl,
    String? avatarUuid,
    int? age,
    String? profession,
  }) async {
    final response = await Dio().post(
      'https://grafu-back.herokuapp.com/v1/user/register',
      data: {
        'email': email,
        'name': name,
        'avatarUrl': avatarUrl,
        'avatarUuid': avatarUuid,
        'age': age,
        'profession':
            (profession == null || profession.isEmpty) ? null : profession,
      },
    );

    final jsonS = json.encode(response.data);
    return UserResponseMapper.jsonToEntity(jsonS);
  }
}
