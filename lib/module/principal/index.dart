import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/gallery/index.dart';
import 'package:grafu/module/principal/playday/index.dart';
import 'package:grafu/module/principal/profile/index.dart';
import 'package:grafu/state/user_state.dart';
import 'package:grafu/store/user_store.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  PrincipalPageState createState() => PrincipalPageState();
}

class PrincipalPageState extends State<PrincipalPage> {
  final pageViewController = PageController();
  final store = Modular.get<UserStore>();

  @override
  void initState() {
    super.initState();
    store.fetchUser();
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  Widget buildBottomNavigationBar() {
    return AnimatedBuilder(
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
    );
  }

  Widget buildPageView() {
    return PageView(
      controller: pageViewController,
      children: [
        const ProfilePage(),
        PlaydayPage(),
        GalleryPage(),
      ],
    );
  }

  Widget buildScaffold() {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildNavigatePages(_, state, __) {
    if (state is LoadingUserState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ErrorUserState) {
      return Center(
        child: Text(state.message),
      );
    }

    if (state is SuccessUserState) {
      return Container(
        child: buildScaffold(),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValueListenableBuilder<UserState>(
        valueListenable: store,
        builder: buildNavigatePages,
      ),
    );
  }
}
