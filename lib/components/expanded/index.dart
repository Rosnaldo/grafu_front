import 'package:flutter/material.dart';

class ExpandedMembers extends StatelessWidget {
  final List<String> list;

  const ExpandedMembers({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Convidados'),
      children: <Widget>[
        ...list.map(
          (member) => Text(member),
        ),
      ],
    );
  }
}
