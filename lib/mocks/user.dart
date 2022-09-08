import 'package:grafu/models/avatar.dart';
import 'package:grafu/models/user.dart';

class MakeUser {
  static User make() {
    return const User(
      id: '6288baef-a9fe-4c55-a15e-eb07c7fc0c0a',
      name: 'Andrey K Tsuzuki',
      email: 'andreytsuzuki@gmail.com',
      avatar: Avatar(
        url:
            'https://media-exp1.licdn.com/dms/image/C4D03AQG3j392gmNRfQ/profile-displayphoto-shrink_800_800/0/1622327303559?e=1665014400&v=beta&t=3sy3EDBNl507QBSEALd1BMbVBsEReWuyPS2VqBixo64',
        uuid: '00bef51-543c-49f3-b3b1-312e02299d6b',
      ),
    );
  }
}
