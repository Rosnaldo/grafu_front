import 'package:grafu/models/user.dart';

abstract class UserState {}

class InitialUserState extends UserState {}

class SuccessUserState extends UserState {
  final User user;
  SuccessUserState(this.user);
}

class LoadingUserState extends UserState {}

class ErrorUserState extends UserState {
  final String message;
  ErrorUserState(this.message);
}
