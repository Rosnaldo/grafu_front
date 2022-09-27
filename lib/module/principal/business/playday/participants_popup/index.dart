import 'package:flutter/material.dart';

import 'package:grafu/models/participant.dart';
import 'package:grafu/module/principal/container/playday/participants_popup/index.dart';
import 'package:grafu/store/is_invited_store/is_invited_store.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';
import 'package:grafu/store/signin_store/index.dart';

class BuildParticipantsPopup {
  static Future<Future<Object?>> showMyDialog(
    BuildContext context,
    List<Participant> participants,
    Widget Function(Participant participant) participantCard,
    IMyParticipantStore myParticipantStore,
    IIsInvitedStore isInvitedStore,
    ISigninStore signinStore,
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
          myParticipantStore: myParticipantStore,
          isInvitedStore: isInvitedStore,
          signinStore: signinStore,
        );
      },
    );
  }
}
