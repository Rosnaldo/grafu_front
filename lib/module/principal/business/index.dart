import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/container/index.dart';
import 'package:grafu/store/global_store.dart';

import 'package:grafu/module/principal/business/gallery/index.dart';
import 'package:grafu/module/principal/business/playday/index.dart';
import 'package:grafu/module/principal/business/profile/index.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({
    Key? key,
  }) : super(key: key);

  @override
  PrincipalPageState createState() => PrincipalPageState();
}

class PrincipalPageState extends State<PrincipalPage> {
  final pageViewController = PageController();
  final store = Modular.get<GlobalStore>();

  @override
  void initState() {
    super.initState();
    store.fetch();
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PrincipalPageContainer(
      pageViewController: pageViewController,
      store: store,
      widgetChildren: const [
        PlaydayPage(),
        ProfilePage(),
        GalleryPage(),
      ],
    );
  }
}
