import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:grafu/module/login/container/index.dart';
import 'package:grafu/services/google_signin/index.dart';
import 'package:grafu/services/sign_in/index.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signIn = Modular.get<SignIn>();
    final signInWithGoogle = Modular.get<SignInWithGoogle>();

    return LoginPageContainer(
      signIn: signIn,
      signInWithGoogle: signInWithGoogle,
    );
  }
}
