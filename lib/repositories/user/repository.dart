import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:grafu/mocks/user.dart';

import 'package:grafu/models/user.dart';
import 'package:grafu/repositories/user/mapper.dart';

abstract class IUserByEmailRepository {
  Future<User> get(email) async {
    return MakeUser.make();
  }
}

class UserByEmailRepository implements IUserByEmailRepository {
  @override
  Future<User> get(email) async {
    final response = await Dio().get(
      'https://grafu-back.herokuapp.com/v1/user/$email',
    );

    final jsonS = json.encode(response.data);

    return UserResponseMapper.jsonToEntity(jsonS);
  }
}
