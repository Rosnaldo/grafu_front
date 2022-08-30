import 'package:grafu/store/signin_store/index.dart';

class MockSigninStore extends ISigninStore {
  MockSigninStore() : super();

  @override
  Future storeLogin(String e) async {}

  @override
  Future removeLogin() async {}

  @override
  Future load() async {}

  @override
  bool get isSignin => true;

  @override
  String get email => 'andreytsuzuki@gmail.com';
}
