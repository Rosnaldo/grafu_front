import 'package:flutter/material.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store.dart';

class GridPageContainer extends StatelessWidget {
  final IGlobalStore store;

  const GridPageContainer({
    Key? key,
    required this.store,
  }) : super(key: key);

  Widget buildImage(String image) {
    return Image.network(
      image,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = store.value as SuccessGlobalState;

    return SafeArea(
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 4.0,
          ),
          children:
              state.playday.gallery.map((image) => buildImage(image)).toList()),
    );
  }
}
