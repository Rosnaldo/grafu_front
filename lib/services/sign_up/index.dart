import 'package:firebase_auth/firebase_auth.dart';
import 'package:grafu/module/register/container/register_model.dart';
import 'package:grafu/utils/failure.dart';

abstract class ISignUp {
  ISignUp();

  Future execute(RegisterModel registerModel) async {}
}

class SignUp extends ISignUp {
  @override
  Future execute(RegisterModel registerModel) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password,
      );
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Failure('Email já cadastrado.');
      }
      throw Failure(e.toString());
    }
  }
}
