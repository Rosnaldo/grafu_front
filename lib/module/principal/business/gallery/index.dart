import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/container/gallery/index.dart';
import 'package:grafu/store/global_store/store.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<GlobalStore>();

    return GalleryPageContainer(
      store: store,
    );
  }
}
