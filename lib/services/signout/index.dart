import 'package:firebase_auth/firebase_auth.dart';
import 'package:grafu/store/signin_store.dart';

abstract class ISignOut {
  ISignOut();

  Future execute() async {}
}

class SignOut extends ISignOut {
  late final SigninStore signinStore;

  SignOut(this.signinStore) : super();

  @override
  Future<void> execute() async {
    await FirebaseAuth.instance.signOut();
    await signinStore.removeLogin();
  }
}
