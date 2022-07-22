import 'dart:io';

import 'package:flutter/material.dart';

import 'package:grafu/components/switch_button/index.dart';
import 'package:grafu/utils.dart';

class BuildUpdatePhotoPopup {
  static Future<void> showMyDialog(
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const UpdatePhotoPopup(),
    );
  }
}

class UpdatePhotoPopup extends StatefulWidget {
  const UpdatePhotoPopup({
    Key? key,
  }) : super(key: key);

  @override
  State<UpdatePhotoPopup> createState() => UpdatePhotoPopupState();
}

class UpdatePhotoPopupState extends State<UpdatePhotoPopup> {
  final isGallery = [false, true];
  String image = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            (image == '') ? Container() : Image.file(File(image)),
            const SizedBox(height: 10.0),
            SwitchButton(
              option1:
                  SwitchButtonOption(label: 'camera', icon: Icons.photo_camera),
              option2: SwitchButtonOption(label: 'galeria', icon: Icons.photo),
              isSelected: isGallery,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final file = await Utils.pickMedia(isGallery: isGallery);

                  if (file == null) return;

                  setState(() => {image = file});
                },
                child: const Text('Carregar foto'),
              ),
              const SizedBox(width: 10.0),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
