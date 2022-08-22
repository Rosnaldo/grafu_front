import 'package:flutter/material.dart';

import 'package:grafu/models/participant.dart';
import 'package:grafu/module/principal/container/playday/participants_popup/index.dart';

class BuildParticipantsPopup {
  static Future<Future<Object?>> showMyDialog(
    BuildContext context,
    List<Participant> participants,
    Widget Function(Participant participant) participantCard,
  ) async {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(microseconds: 200),
      pageBuilder: (BuildContext context, Animation first, Animation second) {
        return ParticipantsPopupContainer(
          participants: participants,
          participantCard: participantCard,
        );
      },
    );
  }
}
