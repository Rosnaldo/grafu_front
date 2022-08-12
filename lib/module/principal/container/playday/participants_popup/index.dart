import 'package:flutter/material.dart';

import 'package:grafu/models/participant.dart';

class BuildParticipantsPopupContainer extends StatelessWidget {
  final List<Participant> participants;
  final Widget Function(Participant participant) participantCard;

  const BuildParticipantsPopupContainer({
    Key? key,
    required this.participants,
    required this.participantCard,
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
                      const Text(
                        'Convidados',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 10),
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
