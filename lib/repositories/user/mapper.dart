import 'package:grafu/models/user.dart';
import 'package:grafu/repositories/user/response_user.dart';

class UserResponseMapper {
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
