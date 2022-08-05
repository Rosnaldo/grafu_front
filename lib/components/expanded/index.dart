import 'package:flutter/material.dart';

class ExpandedParticipants extends StatelessWidget {
  final List<String> list;

  const ExpandedParticipants({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Convidados'),
      children: <Widget>[
        ...list.map(
          (participant) => Text(participant),
        ),
      ],
    );
  }
}
