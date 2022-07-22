import 'package:flutter/material.dart';

import 'package:grafu/models/invited.dart';
import 'package:grafu/pages/playday/invited_card.dart';

class BuildInvitedsPopup {
  static Future<void> showMyDialog(
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const InvitedsPopup(),
    );
  }
}

class InvitedsPopup extends StatefulWidget {
  const InvitedsPopup({
    Key? key,
  }) : super(key: key);

  @override
  State<InvitedsPopup> createState() => InvitedsPopupState();
}

class InvitedsPopupState extends State<InvitedsPopup> {
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
    Invited(
      name: 'Joaninha da Cunha',
      avatar:
          'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
      status: 'Confirmado',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Convidados'),
      content: SizedBox(
        height: 230.0,
        child: SingleChildScrollView(
          child: ListBody(
            children: inviteds
                .map(
                  (invited) => InvitedCard(
                    name: invited.name,
                    avatar: invited.avatar,
                    status: invited.status,
                  ),
                )
                .toList(),
          ),
        ),
      ),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
