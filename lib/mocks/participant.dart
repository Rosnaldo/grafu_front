import 'package:grafu/models/avatar.dart';
import 'package:grafu/models/participant.dart';

class MakeParticipants {
  static List<Participant> make() {
    return const [
      Participant(
        id: '',
        email: 'joazinho@gmail.com',
        name: 'Joaozinho Didi',
        avatar: Avatar(
          url:
              'https://media-exp1.licdn.com/dms/image/C4D03AQFJIju5Eii0xQ/profile-displayphoto-shrink_800_800/0/1650263564730?e=1663804800&v=beta&t=gWMh5ARfG1L7LGlK9vRDv-rV_VcdODZHmAXlb72UeMM',
          uuid: '00bef51-543c-49f3-b3b1-312e02299d6b',
        ),
        status: ParticipantStatus.confirmed,
      ),
      Participant(
        id: '',
        email: 'taina@gmail.com',
        name: 'Tainá Santos',
        avatar: Avatar(
          url:
              'https://media-exp1.licdn.com/dms/image/C4D03AQHAKn6G9ZF3hA/profile-displayphoto-shrink_800_800/0/1658359139701?e=1663804800&v=beta&t=Gs9Veyl9gRO3VA1HDJvm18sjG3uHVEahkcGULhTzx7s',
          uuid: '00bef51-543c-49f3-b3b1-312e02299d6b',
        ),
        status: ParticipantStatus.pending,
      ),
    ];
  }
}
