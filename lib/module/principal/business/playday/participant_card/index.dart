import 'package:flutter/material.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/module/principal/business/playday/index.dart';
import 'package:grafu/module/principal/business/playday/participant_detail_popup/index.dart';
import 'package:grafu/module/principal/container/playday/participant_card.dart';
import 'package:provider/provider.dart';

abstract class IParticipantCard {}

class ParticipantCard extends StatelessWidget with IParticipantCard {
  final Participant participant;
  final IBuildParticipantDetailPopup buildParticipantDetailPopup;

  const ParticipantCard({
    Key? key,
    required this.participant,
    required this.buildParticipantDetailPopup,
  }) : super(key: key);

  onTapCb(context) {
    Provider.of<SelectedParticipantPopup>(context, listen: false)
        .setParticipant(participant);
    buildParticipantDetailPopup.showMyDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:
          ParticipantCardContainer(participant: participant, onTapCb: onTapCb),
    );
  }
}
