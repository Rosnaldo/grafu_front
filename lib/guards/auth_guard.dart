import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/store/login_store.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/');

  Future<User?> getCurrentUser() async {
    final Stream<User?> stream = FirebaseAuth.instance.userChanges();
    await for (final user in stream) {
      if (user == null) {
        return null;
      }
      return user;
    }
    return null;
  }

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final loginStore = Modular.get<LoginStore>();
    final currentUser = await getCurrentUser();
    if (currentUser == null) {
      return true;
    }
    loginStore.setEmail(currentUser.email!);
    return true;
  }
}
