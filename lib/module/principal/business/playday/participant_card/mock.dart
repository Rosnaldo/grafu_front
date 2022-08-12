import 'package:flutter/material.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/module/principal/business/playday/participant_card/index.dart';
import 'package:grafu/module/principal/business/playday/participant_detail_popup/index.dart';
import 'package:grafu/module/principal/container/playday/participant_card.dart';

class MockParticipantCard extends StatelessWidget with IParticipantCard {
  final Participant participant;
  final IBuildParticipantDetailPopup buildParticipantDetailPopup;

  const MockParticipantCard({
    Key? key,
    required this.participant,
    required this.buildParticipantDetailPopup,
  }) : super(key: key);

  onTapCb(BuildContext context) {
    buildParticipantDetailPopup.showMyDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ParticipantCardContainer(
        participant: participant,
        onTapCb: onTapCb,
      ),
    );
  }
}
