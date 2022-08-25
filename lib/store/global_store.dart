import 'package:flutter/cupertino.dart';

import 'package:grafu/repositories/playday/repository.dart';
import 'package:grafu/repositories/user/repository.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/initial_email_store.dart';
import 'package:grafu/store/user_store.dart';

abstract class IGlobalStore extends ValueNotifier<GlobalState> {
  IGlobalStore(super.value);

  Future fetch() async {}
}

class GlobalStore extends IGlobalStore {
  late final UserByEmailRepository userRepository;
  late final PlaydayByIdRepository playdayRepository;
  late final UserStore userStore;
  late final InitialEmailStore initialEmailStore;

  GlobalStore(this.userRepository, this.playdayRepository, this.userStore,
      this.initialEmailStore)
      : super(InitialGlobalState());

  @override
  Future fetch() async {
    value = LoadingGlobalState();
    try {
      final user = await userRepository.get(initialEmailStore.email);

      const playdayId = '1bb79eaa-457f-4380-acaa-c7af614668cf';
      final playday = await playdayRepository.get(playdayId);

      final participants = playday.participants;

      userStore.setUser(user);

      value = SuccessGlobalState(playday, participants);
    } catch (e) {
      value = ErrorGlobalState(e.toString());
    }
  }
}
