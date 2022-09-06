import 'package:flutter/cupertino.dart';
import 'package:grafu/repositories/participant/check_invite_status/index.dart';
import 'package:grafu/repositories/participant/register/index.dart';

import 'package:grafu/repositories/playday/repository.dart';
import 'package:grafu/repositories/user/repository.dart';
import 'package:grafu/store/global_store/state.dart';
import 'package:grafu/store/is_invited_store/is_invited_store.dart';
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

  GlobalStore(
    this.playdayRepository,
    this.participantCheckInviteStatusRepository,
    this.participantRegisterRepository,
    this.userRepository,
    this.userStore,
    this.signinStore,
    this.isInvitedStore,
  ) : super(InitialGlobalState());

  Future setUpParticipantStatus() async {
    const playdayId = '26bdf87b-4917-4d59-87ad-3fa1dd6ce6a8';
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
        isInvitedStore.setIsInvited(true);
      }
    }
  }

  @override
  Future fetch() async {
    const playdayId = '26bdf87b-4917-4d59-87ad-3fa1dd6ce6a8';
    value = LoadingGlobalState();

    try {
      await setUpParticipantStatus();
      final playday = await playdayRepository.get(playdayId);
      final participants = playday.participants;

      value = SuccessGlobalState(playday, participants);
    } catch (e) {
      value = ErrorGlobalState(e.toString());
    }
  }
}
