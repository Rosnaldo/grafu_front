import 'package:grafu/module/login/container/login_model.dart';
import 'package:grafu/services/sign_in/index.dart';

class MockSignIn implements ISignIn {
  @override
  Future execute(LoginModel loginModel) async {}
}
