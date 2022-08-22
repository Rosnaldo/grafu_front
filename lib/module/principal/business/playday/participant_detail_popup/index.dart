import 'package:flutter/material.dart';
import 'package:grafu/module/principal/business/playday/participant_detail_popup/state.dart';
import 'package:grafu/module/principal/container/playday/participant_detail_popup/index.dart';
import 'package:provider/provider.dart';

abstract class IBuildParticipantDetailPopup {
  Future<void> showMyDialog(BuildContext context) async {}
}

class BuildParticipantDetailPopup extends IBuildParticipantDetailPopup {
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
    final participant = context.read<SelectedParticipantPopup>().participant;

    return ParticipantDetailPopupContainer(participant: participant);
  }
}
