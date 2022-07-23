import 'package:flutter/material.dart';
import 'package:grafu/module/principal/playday/index.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:grafu/module/principal/gallery/index.dart';
import 'package:grafu/module/principal/profile/index.dart';
import 'package:grafu/module/login/index.dart';
import 'package:grafu/module/register/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
          builder: (context) => LoginPage(),
        ),
        Story(
          name: 'Register',
          builder: (context) => RegisterPage(),
        ),
        Story(
          name: 'Profile',
          builder: (context) => ProfilePage(),
        ),
        Story(
          name: 'Playday',
          builder: (context) => PlaydayPage(),
        ),
        Story(
          name: 'Gallery',
          builder: (context) => GalleryPage(),
        ),
      ],
    );
  }
}
