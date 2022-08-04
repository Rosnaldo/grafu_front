import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grafu/components/link_redirect/index.dart';

import 'package:grafu/components/password_form_field/index.dart';
import 'package:grafu/components/email_form_field/index.dart';
import 'package:grafu/module/login/google_signin.dart';
import 'package:grafu/module/login/login_model.dart';
import 'package:grafu/utils/failure.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final loginFocusNode = FocusNode();
  var loginModel = LoginModel.init();
  final signInWithGoogle = SignInWithGoogle();

  Future signIn() async {
    try {
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

  @override
  Widget build(BuildContext context) {
    NavigatorState navigator = Navigator.of(context);
    ScaffoldMessengerState scaffMess = ScaffoldMessenger.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  children: <Widget>[
                    const SizedBox(height: 16),
                    EmailFormField(
                      label: 'email',
                      focusNode: emailFocusNode,
                      nextFocusNode: passwordFocusNode,
                      onSaved: (value) =>
                          loginModel = loginModel.copyWith(email: value),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Email obrigatório';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
                            .hasMatch(text)) {
                          return 'Email inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    PassworFormField(
                      label: 'senha',
                      focusNode: passwordFocusNode,
                      nextFocusNode: emailFocusNode,
                      onSaved: (value) =>
                          loginModel = loginModel.copyWith(password: value),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Senha obrigatório';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    const LinkRedirect(
                      title: 'Primeira vez? (cadastrar)',
                      redirectLink: '/register',
                    ),
                    const LinkRedirect(
                      title: 'Esqueceu a senha?',
                      redirectLink: '/reset',
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      focusNode: loginFocusNode,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          try {
                            await signIn();
                            navigator.pushNamed('/principal/playday');
                          } catch (e) {
                            scaffMess.showSnackBar(SnackBar(
                              content: Text(e.toString()),
                            ));
                          }
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('ou'),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: const Text('facebook'),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await signInWithGoogle.execute();
                        navigator.pushNamed('/principal/playday');
                      } catch (e) {
                        scaffMess.showSnackBar(SnackBar(
                          content: Text(e.toString()),
                        ));
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent)),
                    child: const Text('google'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
