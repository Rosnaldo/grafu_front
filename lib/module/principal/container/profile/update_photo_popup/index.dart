import 'package:flutter/material.dart';

import 'package:grafu/components/switch_button/index.dart';
import 'package:grafu/utils/image_platform.dart';
import 'package:grafu/utils/pick_media.dart';

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

class ImageStore extends ValueNotifier<String> {
  ImageStore() : super('');

  setImage(v) => value = v;
}

class UpdatePhotoPopupState extends State<UpdatePhotoPopup> {
  final isGallery = [false, true];
  ImageStore imageStore = ImageStore();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            AnimatedBuilder(
                animation: imageStore,
                builder: (context, child) {
                  return ImagePlatform.image(imageStore: imageStore);
                }),
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
                  final file = await PickMedia.execute(
                      isGallery: isGallery, context: context);

                  if (file == null) return;

                  imageStore.setImage(file);
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
