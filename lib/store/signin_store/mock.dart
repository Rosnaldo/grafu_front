import 'package:grafu/store/signin_store/index.dart';

class MockSigninStore implements ISigninStore {
  @override
  Future storeLogin(String e) async {}

  @override
  Future removeLogin() async {}

  @override
  Future load() async {}

  @override
  bool isSignin() => true;

  @override
  String email() => 'andreytsuzuki@gmail.com';
}
