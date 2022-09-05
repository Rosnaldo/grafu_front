import 'package:flutter/cupertino.dart';

import 'package:grafu/repositories/playday/repository.dart';
import 'package:grafu/store/global_store/state.dart';

abstract class IGlobalStore extends ValueNotifier<GlobalState> {
  IGlobalStore(super.value);

  Future fetch() async {}
}

class GlobalStore extends IGlobalStore {
  late final PlaydayByIdRepository playdayRepository;

  GlobalStore(
    this.playdayRepository,
  ) : super(InitialGlobalState());

  @override
  Future fetch() async {
    const playdayId = '6618fa37-5de2-49cb-9d72-e828da3eab1e';
    value = LoadingGlobalState();

    try {
      final playday = await playdayRepository.get(playdayId);
      final participants = playday.participants;

      value = SuccessGlobalState(playday, participants);
    } catch (e) {
      value = ErrorGlobalState(e.toString());
    }
  }
}
