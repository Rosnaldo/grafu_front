import 'package:flutter/material.dart';
import 'package:grafu/models/member.dart';

class MemberCard extends StatelessWidget {
  final String avatar;
  final String name;
  final MemberStatus status;

  const MemberCard({
    Key? key,
    required this.name,
    required this.avatar,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(1.0),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(avatar),
              radius: 12.0,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(name),
              ),
            ),
            Text(
              Member.statusMapper(status),
              style: TextStyle(
                color: (status == MemberStatus.confirmed)
                    ? Colors.lightGreen
                    : Colors.orangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}