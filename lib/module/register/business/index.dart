import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:grafu/module/register/container/index.dart';
import 'package:grafu/services/google_signin/index.dart';
import 'package:grafu/services/sign_up/index.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signInWithGoogle = Modular.get<SignInWithGoogle>();
    final signUp = Modular.get<SignUp>();

    return RegisterPageContainer(
      signUp: signUp,
      signInWithGoogle: signInWithGoogle,
    );
  }
}
