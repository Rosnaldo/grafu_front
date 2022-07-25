import 'package:flutter/material.dart';

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
        child: Form(
          key: _formKey,
          child: ListView(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.pink,
                    ),
                    child: const Text(
                      'Primeira vez? (cadastrar)',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
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
      ),
    );
  }
}
