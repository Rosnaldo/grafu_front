import 'package:flutter/cupertino.dart';
import 'package:grafu/models/participant.dart';

class SelectedParticipantPopup extends ChangeNotifier {
  Participant _participant = Participant.init();

  Participant get participant => _participant;

  void setParticipant(Participant p) {
    _participant = p;
    notifyListeners();
  }
}