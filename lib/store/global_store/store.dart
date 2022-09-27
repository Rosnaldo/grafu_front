import 'package:flutter/cupertino.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/models/playday.dart';
import 'package:grafu/repositories/participant/check_invite_status/index.dart';
import 'package:grafu/repositories/participant/register/index.dart';

import 'package:grafu/repositories/playday/repository.dart';
import 'package:grafu/repositories/user/repository.dart';
import 'package:grafu/store/global_store/state.dart';
import 'package:grafu/store/is_invited_store/is_invited_store.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';
import 'package:grafu/store/signin_store/index.dart';
import 'package:grafu/store/user_store/user_store.dart';

abstract class IGlobalStore extends ValueNotifier<GlobalState> {
  IGlobalStore(super.value);

  Future fetch() async {}
}

class GlobalStore extends IGlobalStore {
  late final PlaydayByIdRepository playdayRepository;
  late final ParticipantCheckInviteStatusRepository
      participantCheckInviteStatusRepository;
  late final ParticipantRegisterRepository participantRegisterRepository;
  late final UserByEmailRepository userRepository;
  late final UserStore userStore;
  late final SigninStore signinStore;
  late final IsInvitedStore isInvitedStore;
  late final MyParticipantStore myParticipantStore;
  late final Playday playday;

  GlobalStore(
    this.playdayRepository,
    this.participantCheckInviteStatusRepository,
    this.participantRegisterRepository,
    this.userRepository,
    this.userStore,
    this.signinStore,
    this.isInvitedStore,
    this.myParticipantStore,
  ) : super(InitialGlobalState());

  Future setUpParticipantStatus() async {
    const playdayId = 'fcae0492-0e36-49d0-a674-932c547e81d0';
    await signinStore.load();

    if (signinStore.isSignin) {
      final user = await userRepository.get(signinStore.email);
      userStore.setUser(user);

      final participantStatus =
          await participantCheckInviteStatusRepository.get(
        signinStore.email,
        playdayId,
      );

      if (participantStatus == 'null') {
        isInvitedStore.setIsInvited(false);
      }

      if (participantStatus == 'unregistered') {
        await participantRegisterRepository.post(signinStore.email, playdayId);
        isInvitedStore.setIsInvited(true);
      }

      if (participantStatus == 'pending' || participantStatus == 'confirmed') {
        setUpMyParticipant();
        isInvitedStore.setIsInvited(true);
      }
    }
  }

  getParticipantsWithoutMyParticipant() {
    final index = getMyParticipantIndex();

    if (index == -1) {
      return playday.participants;
    }

    final listWithoutMyParticipant = [
      ...playday.participants.sublist(0, index),
      ...playday.participants.sublist(index + 1, playday.participants.length),
    ];
    return listWithoutMyParticipant;
  }

  int getMyParticipantIndex() {
    return playday.participants.indexWhere((p) => p.email == signinStore.email);
  }

  setUpMyParticipant() {
    final index = getMyParticipantIndex();

    final myParticipant = Participant(
      id: playday.participants[index].id,
      name: userStore.getUser().name,
      email: userStore.getUser().email,
      avatar: userStore.getUser().avatar,
      age: userStore.getUser().age,
      profession: userStore.getUser().profession,
      status: playday.participants[index].status,
    );

    myParticipantStore.setMyParticipant(myParticipant);
  }

  @override
  Future fetch() async {
    const playdayId = 'fcae0492-0e36-49d0-a674-932c547e81d0';
    value = LoadingGlobalState();

    try {
      playday = await playdayRepository.get(playdayId);

      await setUpParticipantStatus();

      final participantsWithoutMy = getParticipantsWithoutMyParticipant();

      value = SuccessGlobalState(playday, participantsWithoutMy);
    } catch (e) {
      value = ErrorGlobalState(e.toString());
    }
  }
}
