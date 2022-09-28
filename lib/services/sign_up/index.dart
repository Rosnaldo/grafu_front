import 'package:firebase_auth/firebase_auth.dart';
import 'package:grafu/module/register/container/register_model.dart';
import 'package:grafu/repositories/user/repository_register.dart';
import 'package:grafu/utils/failure.dart';

abstract class ISignUp {
  Future execute(RegisterModel registerModel) async {}
}

class SignUp implements ISignUp {
  late final UserRegisterRepository userRegisterRepository;

  SignUp(this.userRegisterRepository) : super();

  @override
  Future execute(RegisterModel registerModel) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password,
      );
      final user = FirebaseAuth.instance.currentUser!;

      await user.sendEmailVerification();

      await userRegisterRepository.execute(
        name: registerModel.name,
        avatarUrl: user.photoURL,
        email: registerModel.email,
        age: registerModel.age,
        profession: registerModel.profession,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Failure('Email já cadastrado.');
      }
      throw Failure(e.toString());
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}
