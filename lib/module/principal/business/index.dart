import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/container/index.dart';
import 'package:grafu/store/global_store.dart';

import 'package:grafu/module/principal/business/gallery/index.dart';
import 'package:grafu/module/principal/business/playday/index.dart';
import 'package:grafu/module/principal/business/profile/index.dart';
import 'package:grafu/store/login_store.dart';

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
  final loginStore = Modular.get<LoginStore>();

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

  List<Widget> widgetChildren() {
    final List<Widget> stack = [];
    stack.add(const PlaydayPage());
    if (loginStore.isLogged) {
      stack.add(const ProfilePage());
    }
    stack.add(const GalleryPage());

    return stack;
  }

  List<BottomNavigationBarItem> buildListBottomNavigationBarItem() {
    List<BottomNavigationBarItem> stack = [];

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

    stack.add(evento);
    if (loginStore.isLogged) {
      stack.add(perfil);
    }
    stack.add(galeria);

    return stack;
  }

  @override
  Widget build(BuildContext context) {
    return PrincipalPageContainer(
      pageViewController: pageViewController,
      store: store,
      widgetChildren: widgetChildren(),
      buildListBottomNavigationBarItem: buildListBottomNavigationBarItem(),
    );
  }
}
