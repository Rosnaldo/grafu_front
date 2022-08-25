import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class ISignInWithGoogle {
  ISignInWithGoogle();

  Future execute() async {}
}

class SignInWithGoogle extends ISignInWithGoogle {
  SignInWithGoogle() : super();

  @override
  Future execute() async {
    if (isWeb()) {
      return web();
    }
    return androidIos();
  }

  bool isWeb() {
    return kIsWeb;
  }

  Future web() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }

  Future androidIos() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
  }
}
