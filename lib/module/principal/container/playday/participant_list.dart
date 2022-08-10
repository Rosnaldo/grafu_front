import 'package:flutter/material.dart';
import 'package:grafu/models/participant.dart';

import 'package:grafu/module/principal/container/playday/participant_card.dart';
import 'package:grafu/module/principal/container/playday/participants_popup/index.dart';

class ParticipantList extends StatelessWidget {
  final List<Participant> participants;

  const ParticipantList({
    Key? key,
    required this.participants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Convidados',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Column(
            children: participants
                .sublist(0, 3)
                .map(
                  (participant) => ParticipantCard(
                    name: participant.name,
                    avatar: participant.avatar,
                    status: participant.status,
                  ),
                )
                .toList()),
        const SizedBox(height: 10.0),
        ElevatedButton.icon(
          icon: const Icon(Icons.group, size: 15.0),
          onPressed: () => {
            BuildParticipantsPopup.showMyDialog(context, participants),
          },
          label: const Text(
            'Ver convidados',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0)),
            backgroundColor: MaterialStateProperty.all(Colors.pink.shade200),
          ),
        ),
      ],
    );
  }
}
