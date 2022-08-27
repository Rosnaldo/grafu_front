import 'package:flutter/material.dart';
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
      ],
      buildListBottomNavigationBarItem: const [
        BottomNavigationBarItem(
          label: 'Evento',
          icon: Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.event_available),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Perfil',
          icon: Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.person),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Galleria',
          icon: Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.table_rows),
          ),
        )
      ],
    );
  }
}
