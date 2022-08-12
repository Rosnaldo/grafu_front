import 'package:flutter/material.dart';

import 'package:grafu/models/participant.dart';
import 'package:grafu/module/principal/container/playday/participant_card.dart';

class BuildParticipantsPopup {
  static Future<Future<Object?>> showMyDialog(
    BuildContext context,
    List<Participant> participants,
  ) async {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(microseconds: 200),
      pageBuilder: (BuildContext context, Animation first, Animation second) {
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
                                (participant) =>
                                    ParticipantCard(participant: participant),
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
      },
    );
  }
}
