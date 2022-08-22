import 'package:dio/dio.dart';

class UserUpdateAvatarRepository {
  Future<void> put(String id, String avatar) async {
    await Dio().put(
      'https://grafu-back.herokuapp.com/v1/user/$id',
      data: {'avatar': avatar},
    );
  }
}
