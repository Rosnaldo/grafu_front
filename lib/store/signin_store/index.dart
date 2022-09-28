import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ISigninStore {
  bool isSignin() => true;
  String? email() => '';
  Future storeLogin(String e) async {}
  Future removeLogin() async {}
  Future load() async {}
}

class SigninStore implements ISigninStore {
  late final FlutterSecureStorage secureStorage;
  late String? _email;

  SigninStore(this.secureStorage) : super();

  @override
  Future storeLogin(String e) async {
    await secureStorage.write(key: 'email', value: e);
    _email = e;
  }

  @override
  Future removeLogin() async {
    await secureStorage.delete(key: 'email');
  }

  @override
  Future load() async {
    _email = await secureStorage.read(key: 'email');
  }

  @override
  bool isSignin() {
    return _email != null;
  }

  @override
  String? email() {
    return _email;
  }
}
