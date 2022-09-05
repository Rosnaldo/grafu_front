import 'package:flutter/cupertino.dart';
import 'package:grafu/repositories/participant/check_invite_status/index.dart';

import 'package:grafu/repositories/participant/register/index.dart';
import 'package:grafu/repositories/playday/repository.dart';
import 'package:grafu/repositories/user/repository.dart';
import 'package:grafu/store/is_invited_store/is_invited_store.dart';
import 'package:grafu/store/signin_store/index.dart';
import 'package:grafu/store/user_credetials_loading_store/state.dart';
import 'package:grafu/store/user_store/user_store.dart';

abstract class IUserCredentialsLoadingStore
    extends ValueNotifier<UserCredentialsLoadingState> {
  IUserCredentialsLoadingStore(super.value);

  Future fetch() async {}
}

class UserCredentialsLoadingStore extends IUserCredentialsLoadingStore {
  late final ParticipantCheckInviteStatusRepository
      participantCheckInviteStatusRepository;
  late final ParticipantRegisterRepository participantRegisterRepository;
  late final UserByEmailRepository userRepository;
  late final PlaydayByIdRepository playdayRepository;
  late final UserStore userStore;
  late final SigninStore signinStore;
  late final IsInvitedStore isInvitedStore;

  UserCredentialsLoadingStore(
    this.participantCheckInviteStatusRepository,
    this.participantRegisterRepository,
    this.userRepository,
    this.playdayRepository,
    this.userStore,
    this.signinStore,
    this.isInvitedStore,
  ) : super(InitialUserCredentialsLoadingState());

  Future setUpParticipantStatus() async {
    const playdayId = '6618fa37-5de2-49cb-9d72-e828da3eab1e';
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
    value = LoadingUserCredentialsLoadingState();
    try {
      await Future.wait<void>([
        Future.delayed(const Duration(seconds: 3), () {}),
        setUpParticipantStatus(), // longer (which gives 4) is first
      ]);

      value = SuccessUserCredentialsLoadingState();
    } catch (e) {
      value = ErrorUserCredentialsLoadingState(e.toString());
    }
  }
}
