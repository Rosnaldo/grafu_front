import 'package:flutter/material.dart';
import 'package:grafu/components/link_redirect/index.dart';
import 'package:grafu/components/screener/index.dart';

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
    return const SafeArea(
      child: Screener(
        children: [
          SizedBox(
            height: 20.0,
          ),
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
    );
  }
}
