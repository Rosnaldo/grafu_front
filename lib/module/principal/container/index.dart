import 'package:flutter/material.dart';
import 'package:grafu/components/shimmer/index.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store/index.dart';
import 'package:shimmer/shimmer.dart';

class PrincipalPageContainer extends StatefulWidget {
  final PageController pageViewController;
  final IGlobalStore store;
  final List<Widget> widgetChildren;
  final List<BottomNavigationBarItem> buildListBottomNavigationBarItem;

  const PrincipalPageContainer({
    Key? key,
    required this.pageViewController,
    required this.store,
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
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.pageViewController.page?.round() ?? 0,
          selectedItemColor: Colors.blue,
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
    return Padding(
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
        ],
      ),
    );
  }

  Widget buildNavigatePages(_, GlobalState state, __) {
    if (state is LoadingGlobalState) {
      return Center(
        child: buildShimmerEffect(),
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

    return Column();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        home: ValueListenableBuilder<GlobalState>(
          valueListenable: widget.store,
          builder: buildNavigatePages,
        ),
      ),
    );
  }
}
