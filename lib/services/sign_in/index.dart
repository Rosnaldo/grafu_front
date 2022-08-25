import 'package:firebase_auth/firebase_auth.dart';
import 'package:grafu/utils/failure.dart';
import 'package:grafu/module/login/container/login_model.dart';

abstract class ISignIn {
  ISignIn();

  Future execute(LoginModel loginModel) async {}
}

class SignIn extends ISignIn {
  SignIn() : super();

  @override
  Future execute(LoginModel loginModel) async {
    try {
      await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );

      final isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      if (!isEmailVerified) {
        throw Failure('Email não foi ativado ainda.');
      }
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
