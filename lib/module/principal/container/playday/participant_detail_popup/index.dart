import 'package:flutter/material.dart';

class BuildParticipantDetailPopup {
  static Future<void> showMyDialog(
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const ParticipantDetailPopup(),
    );
  }
}

class ParticipantDetailPopup extends StatefulWidget {
  const ParticipantDetailPopup({
    Key? key,
  }) : super(key: key);

  @override
  State<ParticipantDetailPopup> createState() => ParticipantDetailPopupState();
}

class ParticipantDetailPopupState extends State<ParticipantDetailPopup> {
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
            child: Image.network(
                height: 200.0,
                'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0'),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                  'Name: ',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
                ),
                Text('Andrey Kenji Tsuzuki'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                  'Profissão: ',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
                ),
                Text('desenvolvedor'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                  'Idade: ',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
                ),
                Text('30'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
