import 'package:flutter/cupertino.dart';

import 'package:grafu/repositories/participant/repository_register.dart';
import 'package:grafu/repositories/playday/repository.dart';
import 'package:grafu/repositories/user/repository.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/signin_store/index.dart';
import 'package:grafu/store/user_store.dart';

abstract class IGlobalStore extends ValueNotifier<GlobalState> {
  IGlobalStore(super.value);

  Future fetch() async {}
}

class GlobalStore extends IGlobalStore {
  late final ParticipantRegisterRepository participantRegisterRepository;
  late final UserByEmailRepository userRepository;
  late final PlaydayByIdRepository playdayRepository;
  late final UserStore userStore;
  late final SigninStore signinStore;

  GlobalStore(
    this.participantRegisterRepository,
    this.userRepository,
    this.playdayRepository,
    this.userStore,
    this.signinStore,
  ) : super(InitialGlobalState());

  @override
  Future fetch() async {
    value = LoadingGlobalState();
    try {
      await signinStore.load();
      const playdayId = '6618fa37-5de2-49cb-9d72-e828da3eab1e';

      if (signinStore.isSignin) {
        final user = await userRepository.get(signinStore.email);
        userStore.setUser(user);
        await participantRegisterRepository.post(signinStore.email, playdayId);
      }

      final playday = await playdayRepository.get(playdayId);
      final participants = playday.participants;

      value = SuccessGlobalState(playday, participants);
    } catch (e) {
      value = ErrorGlobalState(e.toString());
    }
  }
}
