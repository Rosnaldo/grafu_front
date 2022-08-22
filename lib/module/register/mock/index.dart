import 'package:flutter/material.dart';

import 'package:grafu/module/register/container/index.dart';
import 'package:grafu/services/google_signin/mock.dart';
import 'package:grafu/services/sign_up/mock.dart';

class MockRegisterPage extends StatelessWidget {
  const MockRegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterPageContainer(
      signUp: MockSignUp(),
      signInWithGoogle: MockSignInWithGoogle(),
    );
  }
}
