import 'package:grafu/models/invited.dart';

class MakeInviteds {
  static List<Invited> make() {
    return [
      Invited(
        name: 'Joaninha da Cunha',
        avatar:
            'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
        status: 'Confirmado',
      ),
      Invited(
        name: 'Joaozinho Didi',
        avatar:
            'https://media-exp1.licdn.com/dms/image/C4D03AQFJIju5Eii0xQ/profile-displayphoto-shrink_800_800/0/1650263564730?e=1663804800&v=beta&t=gWMh5ARfG1L7LGlK9vRDv-rV_VcdODZHmAXlb72UeMM',
        status: 'Confirmado',
      ),
      Invited(
        name: 'Tainá Santos',
        avatar:
            'https://media-exp1.licdn.com/dms/image/C4D03AQHAKn6G9ZF3hA/profile-displayphoto-shrink_800_800/0/1658359139701?e=1663804800&v=beta&t=Gs9Veyl9gRO3VA1HDJvm18sjG3uHVEahkcGULhTzx7s',
        status: 'Confirmado',
      ),
    ];
  }
}
