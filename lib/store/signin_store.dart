import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SigninStore {
  late final FlutterSecureStorage secureStorage;
  late String? _email;

  SigninStore(this.secureStorage) : super();

  Future storeLogin(String e) async {
    await secureStorage.write(key: 'email', value: e);
    _email = e;
  }

  Future removeLogin() async {
    await secureStorage.delete(key: 'email');
  }

  Future load() async {
    _email = await secureStorage.read(key: 'email');
  }

  bool get isSignin => _email != null;

  String? get email => _email;
}
