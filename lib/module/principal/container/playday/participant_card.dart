import 'package:flutter/material.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/module/principal/container/playday/participant_detail_popup/index.dart';

class ParticipantCard extends StatelessWidget {
  final String avatar;
  final String name;
  final ParticipantStatus status;

  const ParticipantCard({
    Key? key,
    required this.name,
    required this.avatar,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => BuildParticipantDetailPopup.showMyDialog(context),
      child: Card(
        margin: const EdgeInsets.all(1.0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatar),
                radius: 18.0,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(name),
                ),
              ),
              Text(
                Participant.statusMapper(status),
                style: TextStyle(
                  color: (status == ParticipantStatus.confirmed)
                      ? Colors.lightGreen
                      : Colors.orangeAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
