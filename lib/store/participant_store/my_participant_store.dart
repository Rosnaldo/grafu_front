import 'package:mobx/mobx.dart';

import 'package:grafu/mocks/participant.dart';
import 'package:grafu/models/participant.dart';

part 'my_participant_store.g.dart';

abstract class IMyParticipantStore {
  Participant getMyParticipant() {
    return MakeParticipants.make()[0];
  }

  setMyParticipant(Participant p) {}
}

class MyParticipantStore implements IMyParticipantStore {
  final participantMobx = MyParticipantMobx();

  @override
  Participant getMyParticipant() {
    return participantMobx.getMyParticipant;
  }

  @override
  setMyParticipant(Participant p) {
    participantMobx.setMyParticipant(p);
  }
}

class MyParticipantMobx = MyParticipantMobxBase with _$MyParticipantMobx;

abstract class MyParticipantMobxBase with Store {
  @observable
  Participant _participant = MakeParticipants.make()[0];

  @computed
  Participant get getMyParticipant => _participant;

  @action
  setMyParticipant(Participant p) {
    _participant = p;
  }
}
