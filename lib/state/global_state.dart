import 'package:grafu/models/participant.dart';
import 'package:grafu/models/playday.dart';

abstract class GlobalState {}

class InitialGlobalState extends GlobalState {}

class SuccessGlobalState extends GlobalState {
  final Playday playday;
  final List<Participant> participants;
  SuccessGlobalState(this.playday, this.participants);
}

class LoadingGlobalState extends GlobalState {}

class ErrorGlobalState extends GlobalState {
  final String message;
  ErrorGlobalState(this.message);
}
