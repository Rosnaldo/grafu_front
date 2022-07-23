import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/gallery/index.dart';
import 'package:grafu/module/principal/playday/index.dart';
import 'package:grafu/module/principal/profile/index.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  PrincipalPageState createState() => PrincipalPageState();
}

class PrincipalPageState extends State<PrincipalPage> {
  final pageViewController = PageController();
  final store = Modular.get<GlobalStore>();

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
              label: 'Evento',
              icon: Icon(Icons.event_available),
            ),
            BottomNavigationBarItem(
              label: 'Perfil',
              icon: Icon(Icons.person),
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
      children: const [
        PlaydayPage(),
        ProfilePage(),
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
    if (state is LoadingGlobalState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ErrorGlobalState) {
      return Center(
        child: Text(state.message),
      );
    }

    if (state is SuccessGlobalState) {
      return Container(
        child: buildScaffold(),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValueListenableBuilder<GlobalState>(
        valueListenable: store,
        builder: buildNavigatePages,
      ),
    );
  }
}
