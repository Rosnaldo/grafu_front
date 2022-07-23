import 'package:flutter/cupertino.dart';
import 'package:grafu/repositories/invited_repository.dart';
import 'package:grafu/repositories/playday_repository.dart';
import 'package:grafu/repositories/user_repository.dart';
import 'package:grafu/state/global_state.dart';

class GlobalStore extends ValueNotifier<GlobalState> {
  late final UserRepository userRepository;
  late final PlaydayRepository playdayRepository;
  late final InvitedRepository invitedRepository;

  GlobalStore(
      this.userRepository, this.playdayRepository, this.invitedRepository)
      : super(InitialGlobalState());

  Future fetchUser() async {
    value = LoadingGlobalState();
    try {
      final user = await userRepository.get();
      final playday = await playdayRepository.get();
      final inviteds = await invitedRepository.get();

      value = SuccessGlobalState(user, playday, inviteds);
    } catch (e) {
      value = ErrorGlobalState(e.toString());
    }
  }
}
