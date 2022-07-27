import 'package:flutter/material.dart';
import 'package:grafu/components/email_form_field/index.dart';

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
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                onSaved: (value) {
                  email = value as String;
                },
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                focusNode: sendFocusNode,
                onPressed: () => {Navigator.of(context).pushNamed('/login')},
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
