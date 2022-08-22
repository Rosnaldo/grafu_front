import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/business/profile/update_photo_popup/index.dart';
import 'package:grafu/module/principal/container/profile/index.dart';
import 'package:grafu/services/google_signout/index.dart';
import 'package:grafu/store/global_store.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<GlobalStore>();

    onTapCb(context) {
      final buildUpdatePhotoPopup = BuildUpdatePhotoPopup();
      buildUpdatePhotoPopup.showMyDialog(context);
    }

    return ProfilePageContainer(
      store: store,
      signOut: SignOut(),
      onTapCb: onTapCb,
    );
  }
}
