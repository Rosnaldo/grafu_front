import 'package:flutter/cupertino.dart';
import 'package:grafu/mocks/participant.dart';
import 'package:grafu/mocks/playday.dart';
import 'package:grafu/mocks/user.dart';

import 'package:grafu/repositories/playday/repository.dart';
import 'package:grafu/repositories/user/repository.dart';
import 'package:grafu/state/global_state.dart';

abstract class IGlobalStore extends ValueNotifier<GlobalState> {
  IGlobalStore(super.value);

  Future fetch() async {}
}

class GlobalStore extends IGlobalStore {
  late final UserByEmailRepository userRepository;
  late final PlaydayByIdRepository playdayRepository;

  GlobalStore(this.userRepository, this.playdayRepository)
      : super(InitialGlobalState());

  @override
  Future fetch() async {
    value = LoadingGlobalState();
    try {
      // final userAuth = FirebaseAuth.instance.currentUser;
      // final user = await userRepository.get(userAuth!.email);

      // const playdayId = '1bb79eaa-457f-4380-acaa-c7af614668cf';
      // final playday = await playdayRepository.get(playdayId);

      // final participants = playday.participants;

      final user = MakeUser.make();
      final playday = MakePlayday.make();
      final participants = MakeParticipants.make();

      value = SuccessGlobalState(user, playday, participants);
    } catch (e) {
      value = ErrorGlobalState(e.toString());
    }
  }
}
