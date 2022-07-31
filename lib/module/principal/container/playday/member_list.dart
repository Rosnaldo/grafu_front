import 'package:flutter/material.dart';
import 'package:grafu/models/member.dart';

import 'package:grafu/module/principal/container/playday/member_card.dart';
import 'package:grafu/module/principal/container/playday/members_popup/index.dart';

class MemberList extends StatelessWidget {
  final List<Member> members;

  const MemberList({
    Key? key,
    required this.members,
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
            children: members
                .sublist(0, 3)
                .map(
                  (member) => MemberCard(
                    name: member.name,
                    avatar: member.avatar,
                    status: member.status,
                  ),
                )
                .toList()),
        const SizedBox(height: 10.0),
        ElevatedButton.icon(
          icon: const Icon(Icons.group, size: 15.0),
          onPressed: () => {
            BuildMembersPopup.showMyDialog(context, members),
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
