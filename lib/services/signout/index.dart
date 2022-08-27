import 'package:firebase_auth/firebase_auth.dart';
import 'package:grafu/store/login_store.dart';

abstract class ISignOut {
  ISignOut();

  Future execute() async {}
}

class SignOut extends ISignOut {
  late final LoginStore loginStore;

  SignOut(this.loginStore) : super();

  @override
  Future<void> execute() async {
    await FirebaseAuth.instance.signOut();
    loginStore.signout();
  }
}
