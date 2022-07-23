import 'dart:convert';

import 'package:grafu/models/user.dart';

class UserRepository {
  User get() {
    const response = '''{
      "name": "Andrey",
      "email": "andreytsuzuki@gmail.com",
      "avatar":
          "https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0"
    }''';

    final decode = json.decode(response);
    return User.fromMap(decode);
  }
}
