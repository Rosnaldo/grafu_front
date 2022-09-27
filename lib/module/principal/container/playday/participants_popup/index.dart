import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:grafu/models/participant.dart';
import 'package:grafu/module/principal/container/playday/section_title.dart';
import 'package:grafu/store/is_invited_store/is_invited_store.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';
import 'package:grafu/store/signin_store/index.dart';
import 'package:grafu/styles/color.dart';

class ParticipantsPopupContainer extends StatelessWidget {
  final List<Participant> participants;
  final Widget Function(Participant participant) participantCard;
  final IMyParticipantStore myParticipantStore;
  final IIsInvitedStore isInvitedStore;
  final ISigninStore signinStore;

  const ParticipantsPopupContainer({
    Key? key,
    required this.participants,
    required this.participantCard,
    required this.myParticipantStore,
    required this.isInvitedStore,
    required this.signinStore,
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
            color: mainBackGroundPink,
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
                      Observer(builder: (_) {
                        if (isInvitedStore.getIsInvited() &&
                            signinStore.isSignin) {
                          return participantCard(
                              myParticipantStore.getMyParticipant());
                        }
                        return Container();
                      }),
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
