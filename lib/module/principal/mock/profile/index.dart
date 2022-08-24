import 'package:flutter/material.dart';
import 'package:grafu/module/principal/business/profile/update_photo_popup/mock.dart';
import 'package:grafu/module/principal/container/profile/index.dart';
import 'package:grafu/services/signout/mock.dart';
import 'package:grafu/store/mock_global_store.dart';

class MockProfilePage extends StatelessWidget {
  const MockProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onTapCb(context) {
      final buildUpdatePhotoPopup = MockBuildUpdatePhotoPopup();
      buildUpdatePhotoPopup.showMyDialog(context);
    }

    return ProfilePageContainer(
      store: MockGlobalStore(),
      signOut: MockSignOut(),
      onTapCb: onTapCb,
    );
  }
}
