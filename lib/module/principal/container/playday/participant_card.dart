import 'package:flutter/material.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/module/principal/business/playday/index.dart';
import 'package:grafu/module/principal/container/playday/participant_detail_popup/index.dart';
import 'package:provider/provider.dart';

class ParticipantCard extends StatelessWidget {
  final Participant participant;

  const ParticipantCard({
    Key? key,
    required this.participant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<SelectedParticipantPopup>(context, listen: false)
            .setParticipant(participant);

        BuildParticipantDetailPopup.showMyDialog(context);
      },
      child: Card(
        margin: const EdgeInsets.all(1.0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(participant.avatar),
                radius: 18.0,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(participant.name),
                ),
              ),
              Text(
                Participant.statusMapper(participant.status),
                style: TextStyle(
                  color: (participant.status == ParticipantStatus.confirmed)
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
