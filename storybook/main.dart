import 'package:flutter/material.dart';
import 'package:grafu/module/principal/container/index.dart';
import 'package:grafu/module/register/container/index.dart';
import 'package:grafu/module/register/services/sign_up/mock.dart';
import 'package:grafu/module/reset/index.dart';
import 'package:grafu/module/reset_email_message/index.dart';
import 'package:grafu/module/verify_email_message/index.dart';
import 'package:grafu/services/google_signin/mock.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:grafu/module/login/container/index.dart';
import 'package:grafu/module/login/services/sign_in/mock.dart';

import 'package:grafu/module/principal/container/gallery/index.dart';
import 'package:grafu/module/principal/container/playday/index.dart';
import 'package:grafu/module/principal/container/profile/index.dart';

import 'package:grafu/store/mock_global_store.dart';

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
          builder: (context) => LoginPageContainer(
            signIn: MockSignIn(),
            signInWithGoogle: MockSignInWithGoogle(),
          ),
        ),
        Story(
          name: 'Register',
          builder: (context) => RegisterPageContainer(
              signUp: MockSignUp(), signInWithGoogle: MockSignInWithGoogle()),
        ),
        Story(
          name: 'Profile',
          builder: (context) => ProfilePageContainer(store: MockGlobalStore()),
        ),
        Story(
          name: 'Principal',
          builder: (context) => PrincipalPageContainer(
              pageViewController: PageController(),
              store: MockGlobalStore(),
              widgetChildren: [
                PlaydayPageContainer(store: MockGlobalStore()),
                ProfilePageContainer(store: MockGlobalStore()),
                GalleryPageContainer(store: MockGlobalStore()),
              ]),
        ),
        Story(
          name: 'Playday',
          builder: (context) => PlaydayPageContainer(store: MockGlobalStore()),
        ),
        Story(
          name: 'Gallery',
          builder: (context) => GalleryPageContainer(store: MockGlobalStore()),
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
