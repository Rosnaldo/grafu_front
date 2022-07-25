import 'package:flutter/material.dart';

import 'package:grafu/models/invited.dart';
import 'package:grafu/module/principal/container/playday/invited_card.dart';

class BuildInvitedsPopup {
  static Future<void> showMyDialog(
    BuildContext context,
    List<Invited> inviteds,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => InvitedsPopup(inviteds: inviteds),
    );
  }
}

class InvitedsPopup extends StatefulWidget {
  final List<Invited> inviteds;
  const InvitedsPopup({
    Key? key,
    required this.inviteds,
  }) : super(key: key);

  @override
  State<InvitedsPopup> createState() => InvitedsPopupState();
}

class InvitedsPopupState extends State<InvitedsPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Convidados'),
      content: SizedBox(
        height: 230.0,
        child: SingleChildScrollView(
          child: ListBody(
            children: widget.inviteds
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
