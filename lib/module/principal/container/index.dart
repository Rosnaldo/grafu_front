import 'package:flutter/material.dart';
import 'package:grafu/components/screener/index.dart';
import 'package:grafu/components/shimmer/index.dart';
import 'package:grafu/store/global_store/state.dart';
import 'package:grafu/store/global_store/store.dart';
import 'package:grafu/styles/color.dart';

class PrincipalPageContainer extends StatefulWidget {
  final PageController pageViewController;
  final IGlobalStore globalStore;
  final List<Widget> widgetChildren;
  final List<BottomNavigationBarItem> buildListBottomNavigationBarItem;

  const PrincipalPageContainer({
    Key? key,
    required this.pageViewController,
    required this.globalStore,
    required this.widgetChildren,
    required this.buildListBottomNavigationBarItem,
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
          backgroundColor: mainBackGround,
          unselectedIconTheme: const IconThemeData(color: mainStrongText),
          unselectedLabelStyle: const TextStyle(color: mainStrongText),
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.pageViewController.page?.round() ?? 0,
          selectedItemColor: mainOrange,
          onTap: (index) {
            widget.pageViewController.jumpToPage(index);
          },
          items: widget.buildListBottomNavigationBarItem,
        );
      },
    );
  }

  Widget buildPageView() {
    return PageView(
      controller: widget.pageViewController,
      children: widget.widgetChildren,
    );
  }

  Widget buildScaffold() {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildShimmerEffect() {
    return Scaffold(
      body: Screener(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: const [
                ShimmerWidget.rectangular(height: 180),
                SizedBox(height: 5.0),
                ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  leading: ShimmerWidget.circular(width: 25, height: 25),
                  title: ShimmerWidget.rectangular(height: 20),
                ),
                SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ShimmerWidget.rectangular(
                    height: 20,
                    width: 100,
                  ),
                ),
                SizedBox(height: 15.0),
                ShimmerWidget.rectangular(height: 20),
                SizedBox(height: 5.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ShimmerWidget.rectangular(
                    height: 20,
                    width: 220,
                  ),
                ),
                SizedBox(height: 5.0),
                ShimmerWidget.rectangular(height: 20),
                SizedBox(height: 5.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ShimmerWidget.rectangular(
                    height: 20,
                    width: 220,
                  ),
                ),
                SizedBox(height: 5.0),
                ShimmerWidget.rectangular(height: 20),
                // Row(
                //   children: const [
                //     Spacer(),
                //     ShimmerWidget.circular(width: 45, height: 45),
                //     Spacer(),
                //     Spacer(),
                //     ShimmerWidget.circular(width: 45, height: 45),
                //     Spacer(),
                //     Spacer(),
                //     ShimmerWidget.circular(width: 45, height: 45),
                //     Spacer(),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavigatePages(_, GlobalState state, __) {
    if (state is LoadingGlobalState) {
      return Center(
        child: Container(),
      );
    }

    if (state is ErrorGlobalState) {
      return Center(
        child: Text(state.message),
      );
    }

    if (state is SuccessGlobalState) {
      return buildScaffold();
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: mainBackGround),
      home: ValueListenableBuilder<GlobalState>(
        valueListenable: widget.globalStore,
        builder: buildNavigatePages,
      ),
    );
  }
}
