import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grafu/repositories/user/repository_find_one.dart';
import 'package:grafu/repositories/user/repository_register.dart';

abstract class ISignInWithGoogle {
  Future execute() async {}
}

class SignInWithGoogle implements ISignInWithGoogle {
  late final UserRegisterRepository userRegisterRepository;
  late final UserFindOneRepository userFindOneRepository;

  SignInWithGoogle(this.userRegisterRepository, this.userFindOneRepository)
      : super();

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
    // await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    await FirebaseAuth.instance.signInWithPopup(googleProvider);

    final User? currentUser = FirebaseAuth.instance.currentUser;

    final user =
        await userFindOneRepository.execute(email: currentUser!.email!);

    if (user == null) {
      await userRegisterRepository.execute(
        name: currentUser.displayName ?? '',
        email: currentUser.email!,
        avatarUrl: currentUser.photoURL,
      );
    }
  }

  Future androidIos() async {
    // await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final currentUser = FirebaseAuth.instance.currentUser;

    final user = await userFindOneRepository.execute(email: googleUser!.email);

    if (user == null) {
      await userRegisterRepository.execute(
        name: currentUser!.displayName ?? '',
        email: currentUser.email!,
        avatarUrl: currentUser.photoURL,
      );
    }
  }
}
