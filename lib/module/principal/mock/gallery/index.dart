import 'package:flutter/material.dart';
import 'package:grafu/module/principal/container/gallery/index.dart';
import 'package:grafu/store/global_store/mock.dart';

class MockGalleryPage extends StatelessWidget {
  const MockGalleryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GalleryPageContainer(
      store: MockGlobalStore(),
    );
  }
}
