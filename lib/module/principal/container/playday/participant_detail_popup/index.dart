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
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                iconSize: 15,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            const SizedBox(height: 18.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                  height: 300.0,
                  'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text('Name: '),
                  Text('Andrey Kenji Tsuzuki'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text('Profissão: '),
                  Text('desenvolvedor'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text('Idade: '),
                  Text('30'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
