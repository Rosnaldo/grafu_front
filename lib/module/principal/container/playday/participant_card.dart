import 'package:flutter/material.dart';
import 'package:grafu/models/participant.dart';

class ParticipantCardContainer extends StatelessWidget {
  final Participant participant;
  final Function onTapCb;

  const ParticipantCardContainer({
    Key? key,
    required this.participant,
    required this.onTapCb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapCb(context),
      child: Card(
        margin: const EdgeInsets.all(1.0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  participant.avatar != null
                      ? participant.avatar!.url
                      : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
                ),
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
