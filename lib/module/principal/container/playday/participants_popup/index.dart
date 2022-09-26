import 'package:flutter/material.dart';

import 'package:grafu/models/participant.dart';
import 'package:grafu/module/principal/container/playday/section_title.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';

class ParticipantsPopupContainer extends StatelessWidget {
  final List<Participant> participants;
  final Widget Function(Participant participant) participantCard;
  final IMyParticipantStore myParticipantStore;

  const ParticipantsPopupContainer({
    Key? key,
    required this.participants,
    required this.participantCard,
    required this.myParticipantStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20.0),
            color: Colors.white,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    iconSize: 20,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SingleChildScrollView(
                  child: ListBody(
                    children: [
                      const SectionTitle(title: 'Convidados'),
                      const SizedBox(height: 10),
                      participantCard(myParticipantStore.getMyParticipant()),
                      ...participants
                          .map(
                            (participant) => participantCard(participant),
                          )
                          .toList()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
