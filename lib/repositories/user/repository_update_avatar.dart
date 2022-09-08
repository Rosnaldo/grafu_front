import 'package:dio/dio.dart';
import 'package:grafu/models/avatar.dart';

class UserUpdateAvatarRepository {
  Future<void> put(String id, Avatar avatar) async {
    await Dio().put(
      'https://grafu-back.herokuapp.com/v1/user/$id',
      data: {
        'avatarUrl': avatar.url,
        'avatarUuid': avatar.uuid,
      },
    );
  }
}
