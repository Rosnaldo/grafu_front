import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ISignOut {
  ISignOut();

  Future execute() async {}
}

class SignOut extends ISignOut {
  late final FlutterSecureStorage secureStorage;

  SignOut(this.secureStorage) : super();

  @override
  Future<void> execute() async {
    FirebaseAuth.instance.signOut();
    await secureStorage.delete(key: 'token');
  }
}
