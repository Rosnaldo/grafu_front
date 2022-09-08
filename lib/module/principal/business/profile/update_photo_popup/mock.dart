import 'package:flutter/material.dart';
import 'package:grafu/module/principal/business/profile/update_photo_popup/index.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/index.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/store/mock.dart';
import 'package:grafu/store/participant_store/mock.dart';
import 'package:grafu/store/user_store/mock.dart';

class MockBuildUpdatePhotoPopup extends IBuildUpdatePhotoPopup {
  @override
  Future<void> showMyDialog(
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => UpdatePhotoPopupContainer(
        uploadStore: MockImageUploadStore(),
        myParticipantStore: MockMyParticipantStore(),
        userStore: MockUserStore(),
      ),
    );
  }
}
