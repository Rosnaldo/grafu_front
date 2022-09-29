import 'package:grafu/mocks/user.dart';
import 'package:grafu/repositories/participant/check_invite_status/index.dart';
import 'package:grafu/repositories/user/repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:grafu/models/avatar.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/store/global_store/state.dart';
import 'package:grafu/store/signin_store/index.dart';
import 'package:grafu/repositories/participant/register/mock.dart';
import 'package:grafu/repositories/playday/mock_repository.dart';
import 'package:grafu/store/global_store/store.dart';
import 'package:grafu/store/is_invited_store/mock.dart';
import 'package:grafu/store/participant_store/mock.dart';
import 'package:grafu/store/user_store/mock.dart';

import 'store_test.mocks.dart';

@GenerateMocks([
  SigninStore,
  ParticipantCheckInviteStatusRepository,
  UserByEmailRepository
])
void main() {
  final playdayRepository = MockPlaydayByIdRepository();
  final participantCheckInviteStatusRepository =
      MockParticipantCheckInviteStatusRepository();
  final participantRegisterRepository = MockParticipantRegisterRepository();
  final userRepository = MockUserByEmailRepository();
  final userStore = MockUserStore();
  final signinStore = MockSigninStore();
  final isInvitedStore = MockIsInvitedStore();
  final myParticipantStore = MockMyParticipantStore();

  final GlobalStore globalStore = GlobalStore(
    playdayRepository,
    participantCheckInviteStatusRepository,
    participantRegisterRepository,
    userRepository,
    userStore,
    signinStore,
    isInvitedStore,
    myParticipantStore,
  );

  test('''
When user is not signedin and myUser is on participant list it
should remove participant from list and myParticipantStore should be unchanged
''', () async {
    // arrange
    when(signinStore.isSignin()).thenReturn(false);
    when(signinStore.email()).thenReturn('joazinho@gmail.com');
    when(signinStore.load()).thenAnswer(Future.value);

    final expectedParticipantsFinalList = [
      const Participant(
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
    final myInitialParticipant =
        myParticipantStore.getMyParticipant().copyWith();

    // act
    await globalStore.fetch();
    final state = globalStore.value as SuccessGlobalState;

    // assert
    verify(signinStore.load()).called(1);
    expect(
      state.participants,
      equals(expectedParticipantsFinalList),
    );

    expect(
      myParticipantStore.getMyParticipant(),
      equals(myInitialParticipant),
    );
  });

  test('''
When user is signedin and myUser is on participant list it
should remove participant from list and myParticipantStore should be changed and isInvitedStore is true
''', () async {
    // arrange
    when(signinStore.isSignin()).thenReturn(true);
    when(signinStore.email()).thenReturn('joazinho@gmail.com');
    when(signinStore.load()).thenAnswer(Future.value);
    when(participantCheckInviteStatusRepository.get(
      'joazinho@gmail.com',
      'fcae0492-0e36-49d0-a674-932c547e81d0',
    )).thenAnswer((_) async => 'pending');
    when(userRepository.get(
      'joazinho@gmail.com',
    )).thenAnswer((_) => Future.value(MakeUser.make()));

    final expectedParticipantsFinalList = [
      const Participant(
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

    // act
    await globalStore.fetch();
    final state = globalStore.value as SuccessGlobalState;

    // assert
    verify(signinStore.load()).called(1);
    expect(
      state.participants,
      equals(expectedParticipantsFinalList),
    );

    expect(
      myParticipantStore.getMyParticipant(),
      equals(const Participant(
        id: '',
        email: 'joazinho@gmail.com',
        name: 'Joaozinho Didi',
        avatar: Avatar(
          url:
              'https://media-exp1.licdn.com/dms/image/C4D03AQFJIju5Eii0xQ/profile-displayphoto-shrink_800_800/0/1650263564730?e=1663804800&v=beta&t=gWMh5ARfG1L7LGlK9vRDv-rV_VcdODZHmAXlb72UeMM',
          uuid: '00bef51-543c-49f3-b3b1-312e02299d6b',
        ),
        status: ParticipantStatus.confirmed,
      )),
    );

    expect(isInvitedStore.getIsInvited(), true);
  });
}
