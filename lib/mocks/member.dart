import 'package:grafu/models/member.dart';

class MakeMembers {
  static List<Member> make() {
    return [
      Member(
        name: 'Joaninha da Cunha',
        avatar:
            'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
        status: MemberStatus.confirmed,
      ),
      Member(
        name: 'Joaozinho Didi',
        avatar:
            'https://media-exp1.licdn.com/dms/image/C4D03AQFJIju5Eii0xQ/profile-displayphoto-shrink_800_800/0/1650263564730?e=1663804800&v=beta&t=gWMh5ARfG1L7LGlK9vRDv-rV_VcdODZHmAXlb72UeMM',
        status: MemberStatus.confirmed,
      ),
      Member(
        name: 'Tainá Santos',
        avatar:
            'https://media-exp1.licdn.com/dms/image/C4D03AQHAKn6G9ZF3hA/profile-displayphoto-shrink_800_800/0/1658359139701?e=1663804800&v=beta&t=Gs9Veyl9gRO3VA1HDJvm18sjG3uHVEahkcGULhTzx7s',
        status: MemberStatus.pending,
      ),
      Member(
        name: 'Mayrana Brito',
        avatar:
            'https://media-exp1.licdn.com/dms/image/C4D03AQExKff88zXkMQ/profile-displayphoto-shrink_800_800/0/1647887645658?e=1664409600&v=beta&t=q7IXyx_soGecI-WzFSNFPtUbG0aT7rvcwrW0ckl_1dk',
        status: MemberStatus.confirmed,
      ),
      Member(
        name: 'Luiz Roberto Fava',
        avatar:
            'https://media-exp1.licdn.com/dms/image/C4D03AQFszy6cgvKZFg/profile-displayphoto-shrink_800_800/0/1653030063690?e=1664409600&v=beta&t=CsntU7adzK0R22Sk22hut67qIw9YODPjz8THD_Q1cpU',
        status: MemberStatus.confirmed,
      ),
      Member(
        name: 'Mariano Gomide',
        avatar:
            'https://media-exp1.licdn.com/dms/image/C4D03AQFvf2kCA75r_g/profile-displayphoto-shrink_800_800/0/1602959726513?e=1664409600&v=beta&t=WwDBjj-SojHVPKP8Aed1BVaIQOHVO9VhW81T1foOqAU',
        status: MemberStatus.confirmed,
      ),
      Member(
        name: 'Stefanie Voss',
        avatar:
            'https://media-exp1.licdn.com/dms/image/C4D03AQHIFwJXNpJT6g/profile-displayphoto-shrink_800_800/0/1644233369004?e=1664409600&v=beta&t=-a7PwyulQuCeyQJwL8zjQLEOEW66AfzRla1LsjAhyBw',
        status: MemberStatus.confirmed,
      ),
    ];
  }
}
