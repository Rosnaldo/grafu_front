import 'package:flutter/material.dart';
import 'package:grafu/components/email_form_field/index.dart';

class Invite extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final sendFocusNode = FocusNode();

  Invite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Convidar amigo',
          style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700),
        ),
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
                nextFocusNode: sendFocusNode,
                onSaved: (value) => {},
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                focusNode: sendFocusNode,
                onPressed: () => {if (_formKey.currentState!.validate()) {}},
                child: const Text('Enviar convite'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
