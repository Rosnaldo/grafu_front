import 'package:flutter/material.dart';
import 'package:grafu/components/image_popup/index.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store.dart';

class GridPageContainer extends StatelessWidget {
  final IGlobalStore store;

  const GridPageContainer({
    Key? key,
    required this.store,
  }) : super(key: key);

  Widget buildImage(String image, BuildContext context) {
    return Ink.image(
      image: NetworkImage(image),
      fit: BoxFit.cover,
      child: InkWell(
        onTap: () => {
          BuildImagePopup.showMyDialog(context, image),
        },
      ),
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
              state.playday.gallery.map((image) => buildImage(image, context)).toList()),
    );
  }
}
