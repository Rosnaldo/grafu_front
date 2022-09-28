import 'package:grafu/mocks/participant.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';

class MockMyParticipantStore implements IMyParticipantStore {
  @override
  Participant getMyParticipant() {
    return MakeParticipants.make()[0];
  }

  @override
  setMyParticipant(Participant p) {}
}
