import 'package:flutter/material.dart';
import 'package:grafu/components/link_redirect/index.dart';

import 'package:grafu/components/password_form_field/index.dart';
import 'package:grafu/components/email_form_field/index.dart';
import 'package:grafu/module/register/register_model.dart';

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
  var registerModel = RegisterModel.init();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                        registerModel = registerModel.copyWith(email: value),
                  ),
                  const SizedBox(height: 16),
                  PassworFormField(
                    label: 'senha',
                    focusNode: passwordFocusNode,
                    nextFocusNode: emailFocusNode,
                    onSaved: (value) =>
                        registerModel = registerModel.copyWith(password: value),
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
                    onPressed: () => {
                      if (_formKey.currentState!.validate())
                        {Navigator.of(context).pushNamed('/principal/playday')}
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
                  onPressed: () => {},
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
    );
  }
}
