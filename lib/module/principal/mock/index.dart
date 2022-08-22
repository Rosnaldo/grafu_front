import 'package:flutter/cupertino.dart';
import 'package:grafu/module/principal/container/index.dart';
import 'package:grafu/module/principal/mock/gallery/index.dart';
import 'package:grafu/module/principal/mock/playday/index.dart';
import 'package:grafu/module/principal/mock/profile/index.dart';
import 'package:grafu/store/mock_global_store.dart';

class MockPrincipalPage extends StatelessWidget {
  const MockPrincipalPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrincipalPageContainer(
        pageViewController: PageController(),
        store: MockGlobalStore(),
        widgetChildren: const [
          MockPlaydayPage(),
          MockProfilePage(),
          MockGalleryPage(),
        ]);
  }
}
