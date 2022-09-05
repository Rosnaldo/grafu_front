import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/container/index.dart';
import 'package:grafu/store/global_store/store.dart';

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
  final globalStore = Modular.get<GlobalStore>();

  @override
  void initState() {
    super.initState();
    globalStore.fetch();
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  List<Widget> widgetChildren() {
    return const <Widget>[PlaydayPage(), ProfilePage(), GalleryPage()];
  }

  List<BottomNavigationBarItem> buildListBottomNavigationBarItem() {
    const evento = BottomNavigationBarItem(
      label: 'Evento',
      icon: Padding(
        padding: EdgeInsets.all(12.0),
        child: Icon(Icons.event_available),
      ),
    );

    const perfil = BottomNavigationBarItem(
      label: 'Perfil',
      icon: Padding(
        padding: EdgeInsets.all(12.0),
        child: Icon(Icons.person),
      ),
    );

    const galeria = BottomNavigationBarItem(
      label: 'Galleria',
      icon: Padding(
        padding: EdgeInsets.all(12.0),
        child: Icon(Icons.table_rows),
      ),
    );

    return <BottomNavigationBarItem>[
      evento,
      perfil,
      galeria,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PrincipalPageContainer(
      pageViewController: pageViewController,
      globalStore: globalStore,
      widgetChildren: widgetChildren(),
      buildListBottomNavigationBarItem: buildListBottomNavigationBarItem(),
    );
  }
}
