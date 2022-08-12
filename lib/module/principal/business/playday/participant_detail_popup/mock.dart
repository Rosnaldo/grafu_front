import 'package:flutter/material.dart';
import 'package:grafu/mocks/participant.dart';
import 'package:grafu/module/principal/business/playday/participant_detail_popup/index.dart';
import 'package:grafu/module/principal/container/playday/participant_detail_popup/index.dart';

class MockBuildParticipantDetailPopup extends IBuildParticipantDetailPopup {
  @override
  Future<void> showMyDialog(
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const ParticipantDetailPopup(),
    );
  }
}

class ParticipantDetailPopup extends StatelessWidget {
  const ParticipantDetailPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final participant = MakeParticipants.make()[0];

    return ParticipantDetailPopupContainer(participant: participant);
  }
}
