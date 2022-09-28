import 'package:firebase_auth/firebase_auth.dart';
import 'package:grafu/store/signin_store/index.dart';

abstract class ISignOut {
  Future execute() async {}
}

class SignOut implements ISignOut {
  late final SigninStore signinStore;

  SignOut(this.signinStore) : super();

  @override
  Future<void> execute() async {
    await FirebaseAuth.instance.signOut();
    await signinStore.removeLogin();
  }
}
