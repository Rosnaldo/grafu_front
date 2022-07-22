import 'package:flutter/material.dart';

class ExpandedInviteds extends StatelessWidget {
  final List<String> list;

  const ExpandedInviteds({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Convidados'),
      children: <Widget>[
        ...list.map(
          (invited) => Text(invited),
        ),
      ],
    );
  }
}
