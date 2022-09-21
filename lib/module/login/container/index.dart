import 'package:flutter/material.dart';
import 'package:grafu/components/google_button/index.dart';
import 'package:grafu/components/link_redirect/index.dart';
import 'package:grafu/components/or_text/index.dart';

import 'package:grafu/components/password_form_field/index.dart';
import 'package:grafu/components/email_form_field/index.dart';
import 'package:grafu/components/screener/index.dart';
import 'package:grafu/module/login/container/login_model.dart';
import 'package:grafu/services/google_signin/index.dart';
import 'package:grafu/services/sign_in/index.dart';
import 'package:grafu/styles/button.dart';
import 'package:grafu/styles/color.dart';

class LoginPageContainer extends StatefulWidget {
  final ISignIn signIn;
  final ISignInWithGoogle signInWithGoogle;

  const LoginPageContainer({
    Key? key,
    required this.signIn,
    required this.signInWithGoogle,
  }) : super(key: key);

  @override
  State<LoginPageContainer> createState() => LoginPageContainerState();
}

class LoginPageContainerState extends State<LoginPageContainer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final loginFocusNode = FocusNode();
  var loginModel = LoginModel.init();

  @override
  Widget build(BuildContext context) {
    NavigatorState navigator = Navigator.of(context);
    ScaffoldMessengerState scaffMess = ScaffoldMessenger.of(context);

    return SafeArea(
      child: Scaffold(
        body: Screener(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 35.0, bottom: 20.0),
              child: Text(
                'Grafu',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                  color: mainPink,
                ),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: mainPink,
                    ),
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(10.0),
                children: <Widget>[
                  const SizedBox(height: 5.0),
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
                  const SizedBox(height: 35),
                  MainPinkButton(
                    focusNode: loginFocusNode,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        try {
                          await widget.signIn.execute(loginModel);
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
                  const SizedBox(height: 15),
                  const LinkRedirect(
                    title: 'Primeira vez? (cadastrar)',
                    redirectLink: '/register',
                  ),
                  const LinkRedirect(
                    title: 'Esqueceu a senha?',
                    redirectLink: '/reset',
                  ),
                ],
              ),
            ),
            const OrText(),
            GoogleButton(
              onPressed: () async {
                try {
                  await widget.signInWithGoogle.execute();
                  navigator.pushNamed('/principal/playday');
                } catch (e) {
                  scaffMess.showSnackBar(SnackBar(
                    content: Text(e.toString()),
                  ));
                }
              },
            ),
            const SizedBox(height: 150.0),
          ],
        ),
      ),
    );
  }
}
