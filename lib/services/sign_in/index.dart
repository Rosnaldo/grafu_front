import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grafu/utils/failure.dart';
import 'package:grafu/module/login/container/login_model.dart';

abstract class ISignIn {
  ISignIn();

  Future execute(LoginModel loginModel) async {}
}

class SignIn extends ISignIn {
  late final FlutterSecureStorage secureStorage;

  SignIn(this.secureStorage) : super();

  @override
  Future execute(LoginModel loginModel) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );

      final isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      if (!isEmailVerified) {
        throw Failure('Email não foi ativado ainda.');
      }

      final token = await credential.user!.getIdToken();
      await secureStorage.write(key: 'token', value: token);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        throw Failure('Senha ou email invalido.');
      }
      if (e.code == 'user-not-found') {
        throw Failure('Email não cadastrado.');
      }
      throw Failure(e.toString());
    }
  }
}
