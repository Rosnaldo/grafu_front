import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grafu/components/link_redirect/index.dart';

import 'package:grafu/components/password_form_field/index.dart';
import 'package:grafu/components/email_form_field/index.dart';
import 'package:grafu/components/switch_button/index.dart';
import 'package:grafu/module/register/register_model.dart';

import 'name_form_field/index.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmFocusNode = FocusNode();
  final registerFocusNode = FocusNode();
  final isMale = [false, true];
  var registerModel = RegisterModel.init();

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    NavigatorState navigator = Navigator.of(context);

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
                    NameFormField(
                        label: 'nome completo',
                        hintText: 'Preencha seu nome completo',
                        onSaved: (value) =>
                            registerModel = registerModel.copyWith(name: value),
                        focusNode: nameFocusNode,
                        nextFocusNode: emailFocusNode,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Nome completo obrigatório';
                          }
                          return null;
                        }),
                    const SizedBox(height: 16),
                    EmailFormField(
                        label: 'email',
                        focusNode: emailFocusNode,
                        nextFocusNode: passwordFocusNode,
                        onSaved: (value) {
                          registerModel = registerModel.copyWith(email: value);
                        },
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
                        }),
                    const SizedBox(height: 16),
                    SwitchButton(
                      option1: SwitchButtonOption(
                          label: 'masculino', icon: Icons.male),
                      option2: SwitchButtonOption(
                          label: 'feminino', icon: Icons.female),
                      isSelected: isMale,
                    ),
                    const SizedBox(height: 16),
                    PassworFormField(
                        label: 'senha',
                        focusNode: passwordFocusNode,
                        nextFocusNode: confirmFocusNode,
                        onSaved: (value) => registerModel =
                            registerModel.copyWith(password: value),
                        onChanged: (value) {
                          registerModel =
                              registerModel.copyWith(password: value);
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Senha obrigatório';
                          }
                          if (text.length <= 8) {
                            return 'Senha deve ter ao menos 8 caracteres';
                          }
                          if (!RegExp(
                                  r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%*()])[a-zA-Z\d!@#$%*()]+$")
                              .hasMatch(text)) {
                            return r'Senha deve ter 1 letra minúscula, 1 maiúscula, um número e caracter especial !@#$%*()';
                          }
                          return null;
                        }),
                    const SizedBox(height: 16),
                    PassworFormField(
                        label: 'confirmar',
                        focusNode: confirmFocusNode,
                        nextFocusNode: registerFocusNode,
                        onSaved: (value) => registerModel =
                            registerModel.copyWith(confirm: value),
                        onChanged: (value) {
                          registerModel =
                              registerModel.copyWith(confirm: value);
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Confirmação da senha obrigatório';
                          }
                          if (registerModel.password != registerModel.confirm) {
                            return 'Confirmação e senha não são iguais';
                          }
                          return null;
                        }),
                    const SizedBox(height: 5),
                    const LinkRedirect(
                      title: 'Já está cadastrado? (login)',
                      redirectLink: '/',
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      focusNode: registerFocusNode,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          await signUp();
                          navigator.pushNamed('/principal/playday');
                        }
                      },
                      child: const Text('Cadastrar'),
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
      ),
    );
  }
}
