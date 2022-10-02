import 'package:flutter/material.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/styles/color.dart';
import 'package:grafu/styles/font_family.dart';

class ParticipantCardContainer extends StatelessWidget {
  final Participant participant;
  final Function onTapCb;

  const ParticipantCardContainer({
    Key? key,
    required this.participant,
    required this.onTapCb,
  }) : super(key: key);

  String showParticipantName(String name) {
    List<String> list = name.split(' ').toList();

    String first = list[0];
    String last = list[list.length - 1];

    return '$first $last';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapCb(context),
      child: Card(
        color: mainBackGround,
        margin: const EdgeInsets.symmetric(vertical: 3.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
                  child: Text(
                    showParticipantName(participant.name),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: mainFontText,
                      color: mainStrongText,
                    ),
                  ),
                ),
              ),
              Text(
                Participant.statusMapper(participant.status),
                style: TextStyle(
                  color: (participant.status == ParticipantStatus.confirmed)
                      ? confirmedGreen
                      : warnYellow,
                  letterSpacing: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
