import 'package:flutter/cupertino.dart';
import 'package:grafu/repositories/member_repository.dart';
import 'package:grafu/repositories/playday_repository.dart';
import 'package:grafu/repositories/user_repository.dart';
import 'package:grafu/state/global_state.dart';

abstract class IGlobalStore extends ValueNotifier<GlobalState> {
  IGlobalStore(super.value);

  Future fetch() async {}
}

class GlobalStore extends IGlobalStore {
  late final UserRepository userRepository;
  late final PlaydayRepository playdayRepository;
  late final MemberRepository memberRepository;

  GlobalStore(
      this.userRepository, this.playdayRepository, this.memberRepository)
      : super(InitialGlobalState());

  @override
  Future fetch() async {
    value = LoadingGlobalState();
    try {
      final user = await userRepository.get();
      final playday = await playdayRepository.get();
      final members = await memberRepository.get();

      await Future.delayed(const Duration(seconds: 1));

      value = SuccessGlobalState(user, playday, members);
    } catch (e) {
      value = ErrorGlobalState(e.toString());
    }
  }
}
