import 'package:flutter/material.dart';
import 'package:grafu/models/invited.dart';

import 'package:grafu/module/principal/container/playday/invited_card.dart';
import 'package:grafu/module/principal/container/playday/inviteds_popup/index.dart';

class InvitedList extends StatelessWidget {
  final List<Invited> inviteds;

  const InvitedList({
    Key? key,
    required this.inviteds,
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
            children: inviteds
                .sublist(0, 3)
                .map(
                  (invited) => InvitedCard(
                    name: invited.name,
                    avatar: invited.avatar,
                    status: invited.status,
                  ),
                )
                .toList()),
        const SizedBox(height: 10.0),
        ElevatedButton.icon(
          icon: const Icon(Icons.group, size: 15.0),
          onPressed: () => {
            BuildInvitedsPopup.showMyDialog(context, inviteds),
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
