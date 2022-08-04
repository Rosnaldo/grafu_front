import 'package:flutter/material.dart';
import 'package:grafu/components/link_redirect/index.dart';

class VerifyEmailMessagePage extends StatefulWidget {
  const VerifyEmailMessagePage({
    Key? key,
  }) : super(key: key);

  @override
  State<VerifyEmailMessagePage> createState() => VerifyEmailMessagePageState();
}

class VerifyEmailMessagePageState extends State<VerifyEmailMessagePage> {
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
                  child: Text('Um email de ativação de conta foi enviado.'),
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
