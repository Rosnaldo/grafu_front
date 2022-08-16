import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:grafu/models/user.dart';
import 'package:grafu/repositories/user/mapper.dart';

void main() {
  test('UserResponseMapper', () {
    final userjson = {
      "id": "63aa07c0-6c2b-4c18-947f-959718eed5a4",
      "name": "Andrey Tsuzuki",
      "email": "andreytsuzuki@gmail.com",
      "avatar":
          "https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0"
    };

    final jsonS = json.encode(userjson);

    final user = UserResponseMapper.jsonToEntity(jsonS);

    expect(
        user,
        equals(const User(
          id: '63aa07c0-6c2b-4c18-947f-959718eed5a4',
          name: 'Andrey Tsuzuki',
          email: 'andreytsuzuki@gmail.com',
          avatar:
              'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
        )));
  });
}
