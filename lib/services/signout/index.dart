import 'package:firebase_auth/firebase_auth.dart';

abstract class ISignOut {
  ISignOut();

  Future execute() async {}
}

class SignOut extends ISignOut {
  SignOut() : super();

  @override
  Future<void> execute() async {
    FirebaseAuth.instance.signOut();
  }
}
