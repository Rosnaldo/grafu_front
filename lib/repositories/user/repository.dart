import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:grafu/models/user.dart';
import 'package:grafu/repositories/user/mapper.dart';

class UserByEmailRepository {
  Future<User> get(email) async {
    final response = await Dio().get(
      'https://grafu-back.herokuapp.com/v1/user/$email?playday=true',
    );

    final jsonS = json.encode(response.data);

    return UserResponseMapper.jsonToEntity(jsonS);
  }
}
