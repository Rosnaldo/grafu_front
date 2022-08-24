import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/business/profile/update_photo_popup/index.dart';
import 'package:grafu/module/principal/container/profile/index.dart';
import 'package:grafu/services/signout/index.dart';
import 'package:grafu/store/global_store.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  onTapCb(context, user) {
    final buildUpdatePhotoPopup = BuildUpdatePhotoPopup();
    buildUpdatePhotoPopup.showMyDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<GlobalStore>();
    final signOut = Modular.get<SignOut>();

    return ProfilePageContainer(
      store: store,
      signOut: signOut,
      onTapCb: onTapCb,
    );
  }
}
