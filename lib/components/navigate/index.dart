import 'package:flutter/material.dart';
import 'package:grafu/components/navigate/store.dart';

import 'package:grafu/pages/profile/index.dart';
import 'package:grafu/pages/playday/index.dart';

class Navigate extends StatefulWidget {
  const Navigate({Key? key}) : super(key: key);

  @override
  NavigateState createState() => NavigateState();
}

class NavigateState extends State<Navigate> {
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
              ],
            );
          }),
    ));
  }
}
