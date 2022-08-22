import 'package:flutter/material.dart';

import 'package:grafu/module/login/container/index.dart';
import 'package:grafu/services/google_signin/index.dart';
import 'package:grafu/services/sign_in/index.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginPageContainer(
      signIn: SignIn(),
      signInWithGoogle: SignInWithGoogle(),
    );
  }
}
