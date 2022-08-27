import 'package:grafu/models/user.dart';
import 'package:grafu/repositories/user/response_user.dart';

class UserResponseMapper {
  static jsonToEntity(String jsonS) {
    final responsePlayday = ResponseUser.fromJson(jsonS);

    return UserResponseMapper.toEntity(responsePlayday);
  }

  static User toEntity(ResponseUser r) {
    return User(
      id: r.id,
      avatar: r.avatar,
      name: r.name,
      email: r.email,
      age: r.age,
      profession: r.profession,
    );
  }
}