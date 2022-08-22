import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/state/image_load_state.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/store/image_load_store.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store.dart';

import 'package:grafu/utils/cropper/mobile_ui_helper.dart';
import 'package:grafu/utils/image_platform.dart';
import 'package:grafu/utils/pick_media.dart';

class UpdatePhotoPopupContainer extends StatefulWidget {
  const UpdatePhotoPopupContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<UpdatePhotoPopupContainer> createState() =>
      UpdatePhotoPopupContainerState();
}

class UpdatePhotoPopupContainerState extends State<UpdatePhotoPopupContainer> {
  Widget buildImage(ImageUploadState imageState, SuccessGlobalState state) {
    if (imageState is InitialImageUploadState) {
      return Center(child: ImagePlatform.image(image: state.user.avatar));
    }

    if (imageState is LoadingImageUploadState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (imageState is ErrorImageUploadState) {
      return Center(
        child: Text(imageState.message),
      );
    }

    if (imageState is SuccessImageUploadState) {
      return Center(child: ImagePlatform.image(image: state.user.avatar));
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final imageStore = ImageUploadStore();
    final store = Modular.get<GlobalStore>();
    final state = store.value as SuccessGlobalState;

    return ValueListenableBuilder<ImageUploadState>(
      valueListenable: imageStore,
      builder: (_, ImageUploadState imageState, __) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: buildImage(imageState, state),
          ),
          actions: <Widget>[
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final bytes = await PickMedia.execute(
                        uiSettings: buildUiSettings(context),
                      );
                      final userId = state.user.id;

                      imageStore.loadImage(bytes!, userId);
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
      },
    );
  }
}
