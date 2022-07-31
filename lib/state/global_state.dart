import 'package:grafu/models/member.dart';
import 'package:grafu/models/playday.dart';
import 'package:grafu/models/user.dart';

abstract class GlobalState {}

class InitialGlobalState extends GlobalState {}

class SuccessGlobalState extends GlobalState {
  final User user;
  final Playday playday;
  final List<Member> members;
  SuccessGlobalState(this.user, this.playday, this.members);
}

class LoadingGlobalState extends GlobalState {}

class ErrorGlobalState extends GlobalState {
  final String message;
  ErrorGlobalState(this.message);
}
