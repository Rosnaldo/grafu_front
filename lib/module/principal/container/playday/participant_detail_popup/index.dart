import 'package:flutter/material.dart';
import 'package:grafu/models/participant.dart';

class ParticipantDetailPopupContainer extends StatefulWidget {
  final Participant participant;

  const ParticipantDetailPopupContainer({
    Key? key,
    required this.participant,
  }) : super(key: key);

  @override
  State<ParticipantDetailPopupContainer> createState() =>
      ParticipantDetailPopupContainerState();
}

class ParticipantDetailPopupContainerState
    extends State<ParticipantDetailPopupContainer> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              iconSize: 20,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          const SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(height: 200.0, widget.participant.avatar),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  'Name: ',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
                ),
                Text(widget.participant.name),
              ],
            ),
          ),
          (widget.participant.profession != null)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Profissão: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15.0),
                      ),
                      Text(widget.participant.profession ?? ''),
                    ],
                  ),
                )
              : Container(),
          (widget.participant.age != null)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Idade: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15.0),
                      ),
                      Text(widget.participant.age.toString()),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
