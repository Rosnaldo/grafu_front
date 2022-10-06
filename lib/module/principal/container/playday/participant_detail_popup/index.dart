import 'package:flutter/material.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/styles/color.dart';

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
      backgroundColor: mainBackGround,
      scrollable: true,
      content: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              iconSize: 15.0,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          const SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              height: 200.0,
              widget.participant.avatar != null
                  ? widget.participant.avatar!.url
                  : 'https://firebasestorage.googleapis.com/v0/b/grafu-357616.appspot.com/o/avatar-svg%2Favatar.png?alt=media&token=20c54640-1f37-4a5a-b685-85417a0a3667',
            ),
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
