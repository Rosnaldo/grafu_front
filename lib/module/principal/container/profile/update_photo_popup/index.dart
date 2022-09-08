import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/state/avatar_load_state.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/store/avatar_load_store.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';
import 'package:grafu/store/user_store/user_store.dart';

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
  Widget buildImage(AvatarUploadState imageState, UserStore userStore) {
    if (imageState is InitialAvatarUploadState) {
      return Center(
        child: ImagePlatform.image(
          image: userStore.getUser().avatar != null
              ? userStore.getUser().avatar!.url
              : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
        ),
      );
    }

    if (imageState is LoadingAvatarUploadState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (imageState is ErrorAvatarUploadState) {
      return Center(
        child: Text(imageState.message),
      );
    }

    if (imageState is SuccessAvatarUploadState) {
      return Center(
          child: ImagePlatform.image(image: userStore.getUser().avatar!.url));
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final uploadStore = ImageUploadStore();
    final userStore = Modular.get<UserStore>();
    final myParticipantStore = Modular.get<MyParticipantStore>();

    return ValueListenableBuilder<AvatarUploadState>(
      valueListenable: uploadStore,
      builder: (_, AvatarUploadState uploadState, __) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: buildImage(uploadState, userStore),
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
                      await uploadStore.loadImage(
                          bytes!, userStore, myParticipantStore);
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
