import 'package:flutter/material.dart';
import 'package:grafu/components/link_redirect/index.dart';

class ResetEmailMessagePage extends StatefulWidget {
  const ResetEmailMessagePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ResetEmailMessagePage> createState() => ResetEmailMessagePageState();
}

class ResetEmailMessagePageState extends State<ResetEmailMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Align(
                  alignment: Alignment.center,
                  child: Text('Email para resetar a senha foi enviado.'),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text('Cheque o seu email.'),
                ),
                Align(
                  child: LinkRedirect(
                    title: 'Voltar para login',
                    redirectLink: '/',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
