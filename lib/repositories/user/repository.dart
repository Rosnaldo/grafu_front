import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:grafu/models/user.dart';
import 'package:grafu/repositories/user/mapper.dart';
import 'package:grafu/repositories/user/response_user.dart';

class UserByEmailRepository {
  Future<User> get(email) async {
    final response = await Dio().get(
      'https://grafu-back.herokuapp.com/v1/user/$email?playday=true',
    );

    final jsonData = json.encode(response.data);
    final responsePlayday = ResponseUser.fromJson(jsonData);

    return UserResponseMapper.toEntity(responsePlayday);
  }
}
