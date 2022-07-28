import 'package:flutter/material.dart';
import 'package:grafu/module/principal/business/gallery/index.dart';
import 'package:grafu/module/principal/business/grid/index.dart';
import 'package:grafu/module/principal/business/playday/index.dart';
import 'package:grafu/module/principal/business/profile/index.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store.dart';

class PrincipalPageContainer extends StatefulWidget {
  final PageController pageViewController;
  final IGlobalStore store;

  const PrincipalPageContainer({
    Key? key,
    required this.pageViewController,
    required this.store,
  }) : super(key: key);

  @override
  PrincipalPageContainerState createState() => PrincipalPageContainerState();
}

class PrincipalPageContainerState extends State<PrincipalPageContainer> {
  Widget buildBottomNavigationBar() {
    return AnimatedBuilder(
      animation: widget.pageViewController,
      builder: (context, snapshot) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.pageViewController.page?.round() ?? 0,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            widget.pageViewController.jumpToPage(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Evento',
              icon: Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.event_available),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Perfil',
              icon: Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.person),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Galleria',
              icon: Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.table_rows),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Grid',
              icon: Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.grid_view),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildPageView() {
    return PageView(
      controller: widget.pageViewController,
      children: const [
        PlaydayPage(),
        ProfilePage(),
        GalleryPage(),
        GridPage(),
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
        valueListenable: widget.store,
        builder: buildNavigatePages,
      ),
    );
  }
}
