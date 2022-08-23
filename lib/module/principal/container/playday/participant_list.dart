import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/module/principal/business/playday/participants_popup/index.dart';
import 'package:grafu/store/user_store.dart';

class ParticipantList extends StatelessWidget {
  final List<Participant> participants;
  final Widget Function(Participant participant) participantCard;

  const ParticipantList({
    Key? key,
    required this.participants,
    required this.participantCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStore = Modular.get<UserStore>();

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
        Column(children: [
          Observer(builder: (_) {
            return participantCard(Participant(
              id: userStore.user.id,
              avatar: userStore.user.avatar,
              name: userStore.user.name,
              age: userStore.user.age,
              profession: userStore.user.profession,
              status: ParticipantStatus.confirmed,
            ));
          }),
          ...participants
              .sublist(0, 2)
              .map(
                (participant) => participantCard(participant),
              )
              .toList()
        ]),
        const SizedBox(height: 10.0),
        ElevatedButton.icon(
          icon: const Icon(Icons.group, size: 15.0),
          onPressed: () => {
            BuildParticipantsPopup.showMyDialog(
                context, participants, participantCard),
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
