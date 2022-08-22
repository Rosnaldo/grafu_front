import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/index.dart';

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
    return const UpdatePhotoPopupContainer();
  }
}
