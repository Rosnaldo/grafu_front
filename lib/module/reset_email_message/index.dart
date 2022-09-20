import 'package:flutter/material.dart';
import 'package:grafu/components/link_redirect/index.dart';
import 'package:grafu/components/screener/index.dart';

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
    return const Screener(
      children: [
        SizedBox(
          height: 20.0,
        ),
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
    );
  }
}
