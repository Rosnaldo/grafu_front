import 'package:grafu/models/invited.dart';
import 'package:grafu/models/playday.dart';
import 'package:grafu/models/user.dart';

abstract class GlobalState {}

class InitialGlobalState extends GlobalState {}

class SuccessGlobalState extends GlobalState {
  final User user;
  final Playday playday;
  final List<Invited> inviteds;
  SuccessGlobalState(this.user, this.playday, this.inviteds);
}

class LoadingGlobalState extends GlobalState {}

class ErrorGlobalState extends GlobalState {
  final String message;
  ErrorGlobalState(this.message);
}
