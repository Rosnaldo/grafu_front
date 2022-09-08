import 'package:grafu/models/avatar.dart';
import 'package:grafu/models/participant.dart';

class MakeParticipants {
  static List<Participant> make() {
    return const [
      Participant(
        id: '',
        email: '',
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
        email: '',
        name: 'Tainá Santos',
        avatar: Avatar(
          url:
              'https://media-exp1.licdn.com/dms/image/C4D03AQHAKn6G9ZF3hA/profile-displayphoto-shrink_800_800/0/1658359139701?e=1663804800&v=beta&t=Gs9Veyl9gRO3VA1HDJvm18sjG3uHVEahkcGULhTzx7s',
          uuid: '00bef51-543c-49f3-b3b1-312e02299d6b',
        ),
        status: ParticipantStatus.pending,
      ),
      Participant(
        id: '',
        email: '',
        name: 'Mayrana Brito',
        avatar: Avatar(
          url:
              'https://media-exp1.licdn.com/dms/image/C4D03AQG3j392gmNRfQ/profile-displayphoto-shrink_800_800/0/1622327303559?e=1665014400&v=beta&t=3sy3EDBNl507QBSEALd1BMbVBsEReWuyPS2VqBixo64',
          uuid: '00bef51-543c-49f3-b3b1-312e02299d6b',
        ),
        status: ParticipantStatus.confirmed,
      ),
      Participant(
        id: '',
        email: '',
        name: 'Luiz Roberto Fava',
        avatar: Avatar(
          url:
              'https://media-exp1.licdn.com/dms/image/C4D03AQFszy6cgvKZFg/profile-displayphoto-shrink_800_800/0/1653030063690?e=1664409600&v=beta&t=CsntU7adzK0R22Sk22hut67qIw9YODPjz8THD_Q1cpU',
          uuid: '00bef51-543c-49f3-b3b1-312e02299d6b',
        ),
        status: ParticipantStatus.confirmed,
      ),
      Participant(
        id: '',
        email: '',
        name: 'Mariano Gomide',
        avatar: Avatar(
          url:
              'https://media-exp1.licdn.com/dms/image/C4D03AQFvf2kCA75r_g/profile-displayphoto-shrink_800_800/0/1602959726513?e=1664409600&v=beta&t=WwDBjj-SojHVPKP8Aed1BVaIQOHVO9VhW81T1foOqAU',
          uuid: '00bef51-543c-49f3-b3b1-312e02299d6b',
        ),
        status: ParticipantStatus.confirmed,
      ),
    ];
  }
}
