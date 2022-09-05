import 'package:flutter/material.dart';
import 'package:grafu/components/image_popup/index.dart';
import 'package:grafu/components/switch_button/index.dart';
import 'package:grafu/store/global_store/state.dart';
import 'package:grafu/store/global_store/store.dart';

class GalleryStore extends ValueNotifier<List<bool>> {
  GalleryStore() : super([true, false]);

  setGallery(newIndex) {
    if (newIndex == 0) {
      value = [true, false];
    } else {
      value = [false, true];
    }
  }
}

class GalleryPageContainer extends StatelessWidget {
  final IGlobalStore store;

  const GalleryPageContainer({
    Key? key,
    required this.store,
  }) : super(key: key);

  Widget buildGallery(List<String> gallery, BuildContext context) {
    return Column(
      children: [
        ...gallery
            .map((image) => Column(children: [
                  Ink.image(
                    image: NetworkImage(image),
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width * 1,
                    height: 220,
                    child: InkWell(
                      onTap: () => {
                        BuildImagePopup.showMyDialog(context, image),
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                ]))
            .toList(),
      ],
    );
  }

  Widget buildGrid(List<String> gallery, BuildContext context) {
    return GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 4.0,
        ),
        children: gallery
            .map((image) => Ink.image(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: () => {
                      BuildImagePopup.showMyDialog(context, image),
                    },
                  ),
                ))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    final state = store.value as SuccessGlobalState;
    GalleryStore galleryStore = GalleryStore();

    return SafeArea(
      child: ListView(children: [
        AnimatedBuilder(
            animation: galleryStore,
            builder: (context, child) {
              return Column(
                children: [
                  SwitchButton(
                    option1: SwitchButtonOption(
                        label: 'Coluna', icon: Icons.table_rows),
                    option2: SwitchButtonOption(
                        label: 'Grid', icon: Icons.grid_view),
                    isSelected: galleryStore.value,
                    onPressed: (integer) {
                      galleryStore.setGallery(integer);
                    },
                  ),
                  (galleryStore.value[0])
                      ? buildGallery(state.playday.gallery, context)
                      : buildGrid(state.playday.gallery, context),
                ],
              );
            }),
      ]),
    );
  }
}
