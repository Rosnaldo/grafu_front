import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grafu/components/email_form_field/index.dart';
import 'package:grafu/components/link_redirect/index.dart';
import 'package:grafu/module/reset_email_message/reset_model.dart';
import 'package:grafu/utils/failure.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ResetPage> createState() => ResetPageState();
}

class ResetPageState extends State<ResetPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final sendFocusNode = FocusNode();
  var resetModel = ResetModel.init();

  Future resetEmail() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetModel.email);
    } on FirebaseAuthException catch (e) {
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
          child: Form(
            key: _formKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                EmailFormField(
                  label: 'email',
                  focusNode: emailFocusNode,
                  nextFocusNode: sendFocusNode,
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
                  onSaved: (value) {
                    resetModel = resetModel.copyWith(email: value);
                  },
                ),
                const LinkRedirect(
                  title: 'Voltar para login',
                  redirectLink: '/',
                ),
                ElevatedButton(
                  focusNode: sendFocusNode,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      try {
                        await resetEmail();
                        navigator.pushNamed('/reset-email-message');
                      } catch (e) {
                        scaffMess.showSnackBar(SnackBar(
                          content: Text(e.toString()),
                        ));
                      }
                    }
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
