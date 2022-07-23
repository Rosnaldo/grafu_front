import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({
    Key? key,
  }) : super(key: key);

  Widget buildImage(String image) {
    return Column(children: [
      Image.network(
        image,
        fit: BoxFit.fitWidth,
      ),
      const SizedBox(
        height: 2.0,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<GlobalStore>();
    final state = store.value as SuccessGlobalState;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: state.playday.gallery
                  .map((image) => buildImage(image))
                  .toList()),
        ),
      ),
    );
  }
}
