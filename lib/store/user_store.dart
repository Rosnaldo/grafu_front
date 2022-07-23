import 'package:flutter/cupertino.dart';
import 'package:grafu/repositories/user_repository.dart';
import 'package:grafu/state/user_state.dart';

class UserStore extends ValueNotifier<UserState> {
  late final UserRepository repository;

  UserStore(this.repository) : super(InitialUserState());

  Future fetchUser() async {
    value = LoadingUserState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final user = repository.get();
      value = SuccessUserState(user);
    } catch (e) {
      value = ErrorUserState(e.toString());
    }
  }
}
