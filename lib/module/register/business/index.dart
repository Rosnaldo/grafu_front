import 'package:flutter/material.dart';

import 'package:grafu/module/register/container/index.dart';
import 'package:grafu/services/google_signin/index.dart';
import 'package:grafu/services/sign_up/index.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterPageContainer(
      signUp: SignUp(),
      signInWithGoogle: SignInWithGoogle(),
    );
  }
}
