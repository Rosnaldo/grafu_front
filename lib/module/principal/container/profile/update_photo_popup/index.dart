import 'package:flutter/material.dart';
import 'package:grafu/services/firestore/index.dart';

import 'package:grafu/utils/cropper/mobile_ui_helper.dart';
import 'package:grafu/utils/image_platform.dart';
import 'package:grafu/utils/pick_media.dart';

class UpdatePhotoPopupContainer extends StatefulWidget {
  final IFirestoreService firestoreService;

  const UpdatePhotoPopupContainer({
    Key? key,
    required this.firestoreService,
  }) : super(key: key);

  @override
  State<UpdatePhotoPopupContainer> createState() =>
      UpdatePhotoPopupContainerState();
}

class ImageStore extends ValueNotifier<String?> {
  ImageStore() : super(null);

  setValue(v) => value = v;
}

class UpdatePhotoPopupContainerState extends State<UpdatePhotoPopupContainer> {
  ImageStore imageStore = ImageStore();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: AnimatedBuilder(
            animation: imageStore,
            builder: (context, child) {
              return ClipOval(
                child: ImagePlatform.image(imageStore: imageStore),
              );
            }),
      ),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final bytes = await PickMedia.execute(
                    uiSettings: buildUiSettings(context),
                  );

                  final urlDownload =
                      widget.firestoreService.uploadImage(bytes!);

                  imageStore.setValue(urlDownload);
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
