import 'package:flutter/material.dart';

import 'package:grafu/module/login/container/index.dart';
import 'package:grafu/services/google_signin/mock.dart';
import 'package:grafu/services/sign_in/mock.dart';

class MockLoginPage extends StatelessWidget {
  const MockLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginPageContainer(
      signIn: MockSignIn(),
      signInWithGoogle: MockSignInWithGoogle(),
    );
  }
}
