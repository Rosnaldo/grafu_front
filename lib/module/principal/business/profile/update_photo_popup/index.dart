import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/index.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/store/avatar_load_store.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';
import 'package:grafu/store/user_store/user_store.dart';

abstract class IBuildUpdatePhotoPopup {
  Future<void> showMyDialog(BuildContext context) async {}
}

class BuildUpdatePhotoPopup extends IBuildUpdatePhotoPopup {
  @override
  Future<void> showMyDialog(
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const UpdatePhotoPopup(),
    );
  }
}

class UpdatePhotoPopup extends StatelessWidget {
  const UpdatePhotoPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uploadStore = ImageUploadStore();
    final userStore = Modular.get<UserStore>();
    final myParticipantStore = Modular.get<MyParticipantStore>();

    return UpdatePhotoPopupContainer(
      uploadStore: uploadStore,
      userStore: userStore,
      myParticipantStore: myParticipantStore,
    );
  }
}
