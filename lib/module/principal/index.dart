import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/gallery/index.dart';
import 'package:grafu/module/principal/playday/index.dart';
import 'package:grafu/module/principal/playday/playday_date.dart';
import 'package:grafu/module/principal/profile/index.dart';
import 'package:grafu/module/principal/store.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  PrincipalPageState createState() => PrincipalPageState();
}

class PrincipalPageState extends State<PrincipalPage> {
  final store = ScreenStore();
  final pageViewController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: pageViewController,
          children: [
            const ProfilePage(),
            PlaydayPage(),
            GalleryPage(),
          ],
        ),
        bottomNavigationBar: AnimatedBuilder(
          animation: pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: pageViewController.page?.round() ?? 0,
              selectedItemColor: Colors.blue,
              onTap: (index) {
                pageViewController.jumpToPage(index);
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  label: 'Perfil',
                  icon: Icon(Icons.person),
                ),
                BottomNavigationBarItem(
                  label: 'Evento',
                  icon: Icon(Icons.event_available),
                ),
                BottomNavigationBarItem(
                  label: 'Fotos',
                  icon: Icon(Icons.collections),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
