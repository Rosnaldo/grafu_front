import 'package:flutter/material.dart';
import 'package:grafu/module/principal/container/gallery/index.dart';
import 'package:grafu/store/mock_global_store.dart';

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
