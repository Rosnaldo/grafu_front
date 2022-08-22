import 'package:flutter/material.dart';
import 'package:grafu/module/principal/mock/index.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:grafu/module/login/mock/index.dart';
import 'package:grafu/module/principal/mock/gallery/index.dart';
import 'package:grafu/module/principal/mock/playday/index.dart';
import 'package:grafu/module/principal/mock/profile/index.dart';
import 'package:grafu/module/register/mock/index.dart';
import 'package:grafu/module/reset/index.dart';
import 'package:grafu/module/reset_email_message/index.dart';
import 'package:grafu/module/verify_email_message/index.dart';

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
          builder: (context) => const MockLoginPage(),
        ),
        Story(
          name: 'Register',
          builder: (context) => const MockRegisterPage(),
        ),
        Story(
          name: 'Profile',
          builder: (context) => const MockProfilePage(),
        ),
        Story(
          name: 'Principal',
          builder: (context) => const MockPrincipalPage(),
        ),
        Story(
          name: 'Playday',
          builder: (context) => const MockPlaydayPage(),
        ),
        Story(
          name: 'Gallery',
          builder: (context) => const MockGalleryPage(),
        ),
        Story(
          name: 'Reset Email',
          builder: (context) => const ResetPage(),
        ),
        Story(
          name: 'Reset Email Message',
          builder: (context) => const ResetEmailMessagePage(),
        ),
        Story(
          name: 'Verify Email Message',
          builder: (context) => const VerifyEmailMessagePage(),
        ),
      ],
    );
  }
}
