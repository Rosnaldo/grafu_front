import 'package:flutter/material.dart';
import 'package:grafu/components/google_button/index.dart';
import 'package:grafu/components/link_redirect/index.dart';
import 'package:grafu/components/or_text/index.dart';

import 'package:grafu/components/password_form_field/index.dart';
import 'package:grafu/components/email_form_field/index.dart';
import 'package:grafu/components/screener/index.dart';
import 'package:grafu/components/title/index.dart';
import 'package:grafu/module/register/container/age_form_field/index.dart';
import 'package:grafu/module/register/container/profession_form_field/index.dart';
import 'package:grafu/module/register/container/register_model.dart';
import 'package:grafu/services/google_signin/index.dart';
import 'package:grafu/services/sign_up/index.dart';
import 'package:grafu/styles/button.dart';
import 'package:grafu/styles/color.dart';

import 'name_form_field/index.dart';

class RegisterPageContainer extends StatefulWidget {
  final ISignUp signUp;
  final ISignInWithGoogle signInWithGoogle;

  const RegisterPageContainer({
    Key? key,
    required this.signUp,
    required this.signInWithGoogle,
  }) : super(key: key);

  @override
  State<RegisterPageContainer> createState() => RegisterPageContainerState();
}

class RegisterPageContainerState extends State<RegisterPageContainer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameFocusNode = FocusNode();
  final ageFocusNode = FocusNode();
  final professionFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmFocusNode = FocusNode();
  final registerFocusNode = FocusNode();
  final isMale = [false, true];
  var registerModel = RegisterModel.init();

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
            const PageTitle(title: 'Cadastrar'),
            Form(
              key: _formKey,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                children: <Widget>[
                  NameFormField(
                      label: 'nome completo (obrigatório)',
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
                      label: 'email (obrigatório)',
                      focusNode: emailFocusNode,
                      nextFocusNode: ageFocusNode,
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
                  AgeFormField(
                      label: 'idade',
                      hintText: 'Preencha sua idade',
                      onSaved: (value) => registerModel = registerModel
                          .copyWith(age: int.tryParse(value ?? '')),
                      focusNode: ageFocusNode,
                      nextFocusNode: professionFocusNode,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return null;
                        }
                        if (int.tryParse(text) == null) {
                          return 'Idade deve ser um número';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  ProfessionFormField(
                    label: 'profissão',
                    hintText: 'Preencha sua profissão',
                    onSaved: (value) => registerModel =
                        registerModel.copyWith(profession: value),
                    focusNode: professionFocusNode,
                    nextFocusNode: passwordFocusNode,
                  ),
                  const SizedBox(height: 16),
                  PassworFormField(
                      label: 'senha (obrigatório)',
                      focusNode: passwordFocusNode,
                      nextFocusNode: confirmFocusNode,
                      onSaved: (value) => registerModel =
                          registerModel.copyWith(password: value),
                      onChanged: (value) {
                        registerModel = registerModel.copyWith(password: value);
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
                      label: 'confirmar (obrigatório)',
                      focusNode: confirmFocusNode,
                      nextFocusNode: registerFocusNode,
                      onSaved: (value) => registerModel =
                          registerModel.copyWith(confirm: value),
                      onChanged: (value) {
                        registerModel = registerModel.copyWith(confirm: value);
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
                  MainPinkButton(
                    focusNode: registerFocusNode,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        try {
                          await widget.signUp.execute(registerModel);
                          navigator.pushNamed('/verify-email-message');
                        } catch (e) {
                          scaffMess.showSnackBar(SnackBar(
                            content: Text(e.toString()),
                          ));
                        }
                      }
                    },
                    text: 'Cadastrar',
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
