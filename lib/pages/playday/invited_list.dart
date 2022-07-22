import 'package:flutter/material.dart';
import 'package:grafu/models/invited.dart';

import 'package:grafu/pages/playday/invited_card.dart';
import 'package:grafu/pages/playday/inviteds_popup/index.dart';

class InvitedList extends StatelessWidget {
  InvitedList({
    Key? key,
  }) : super(key: key);

  final List<Invited> inviteds = [
    Invited(
      name: 'Joaninha da Cunha',
      avatar:
          'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
      status: 'Confirmado',
    ),
    Invited(
      name: 'Joaninha da Cunha',
      avatar:
          'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
      status: 'Confirmado',
    ),
    Invited(
      name: 'Joaninha da Cunha',
      avatar:
          'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
      status: 'Confirmado',
    ),
  ];

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
            BuildInvitedsPopup.showMyDialog(context),
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
