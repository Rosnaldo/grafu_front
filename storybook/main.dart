import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:grafu/module/principal/container/gallery/index.dart';
import 'package:grafu/module/principal/container/playday/index.dart';
import 'package:grafu/module/principal/container/profile/index.dart';
import 'package:grafu/store/mock_global_store.dart';

import 'package:grafu/module/login/index.dart';
import 'package:grafu/module/register/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeWidget());
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: [
        Story(
          name: 'Login',
          builder: (context) => const LoginPage(),
        ),
        Story(
          name: 'Register',
          builder: (context) => const RegisterPage(),
        ),
        Story(
          name: 'Profile',
          builder: (context) => ProfilePageContainer(store: MockGlobalStore()),
        ),
        Story(
          name: 'Playday',
          builder: (context) => PlaydayPageContainer(store: MockGlobalStore()),
        ),
        Story(
          name: 'Gallery',
          builder: (context) => GalleryPageContainer(store: MockGlobalStore()),
        ),
      ],
    );
  }
}
