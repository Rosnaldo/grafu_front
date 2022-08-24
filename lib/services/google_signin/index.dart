import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class ISignInWithGoogle {
  ISignInWithGoogle();

  Future execute() async {}
}

class SignInWithGoogle extends ISignInWithGoogle {
  late final FlutterSecureStorage secureStorage;

  SignInWithGoogle(this.secureStorage) : super();

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

    final credential =
        await FirebaseAuth.instance.signInWithPopup(googleProvider);

    final token = await credential.user!.getIdToken();
    await secureStorage.write(key: 'token', value: token);
  }

  Future androidIos() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final token = credential.idToken;
    await secureStorage.write(key: 'token', value: token);
  }
}
