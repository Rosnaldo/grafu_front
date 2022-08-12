import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/module/principal/container/playday/index.dart';
import 'package:grafu/store/global_store.dart';

class SelectedParticipantPopup extends ChangeNotifier {
  Participant _participant = Participant.init();

  Participant get participant => _participant;

  void setParticipant(Participant p) {
    _participant = p;
    notifyListeners();
  }
}

class PlaydayPage extends StatelessWidget {
  const PlaydayPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<GlobalStore>();

    return PlaydayPageContainer(
      store: store,
    );
  }
}
