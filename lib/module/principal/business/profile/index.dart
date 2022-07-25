import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/container/profile/index.dart';
import 'package:grafu/store/global_store.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<GlobalStore>();

    return ProfilePageContainer(
      store: store,
    );
  }
}
