import 'package:flutter/material.dart';

import 'package:grafu/components/password_form_field/index.dart';
import 'package:grafu/components/email_form_field/index.dart';
import 'package:grafu/components/switch_button/index.dart';

import 'name_form_field/index.dart';

class RegisterPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmFocusNode = FocusNode();
  final registerFocusNode = FocusNode();
  final isMale = [false, true];

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              NameFormField(
                label: 'nome completo',
                focusNode: nameFocusNode,
                nextFocusNode: emailFocusNode,
              ),
              const SizedBox(height: 16),
              EmailFormField(
                label: 'email',
                focusNode: emailFocusNode,
                nextFocusNode: passwordFocusNode,
              ),
              const SizedBox(height: 16),
              SwitchButton(
                option1:
                    SwitchButtonOption(label: 'masculino', icon: Icons.male),
                option2:
                    SwitchButtonOption(label: 'feminino', icon: Icons.female),
                isSelected: isMale,
              ),
              const SizedBox(height: 16),
              PassworFormField(
                label: 'senha',
                focusNode: passwordFocusNode,
                nextFocusNode: confirmFocusNode,
              ),
              const SizedBox(height: 16),
              PassworFormField(
                label: 'confirmar',
                focusNode: confirmFocusNode,
                nextFocusNode: registerFocusNode,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.pink,
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Já está cadastrado? (login)',
                      style: TextStyle(
                        fontSize: 15,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                focusNode: registerFocusNode,
                onPressed: () => {
                  if (_formKey.currentState!.validate())
                    {Navigator.of(context).pushNamed('/principal')}
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setState(bool Function() param0) {}
}
