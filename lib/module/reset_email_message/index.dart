import 'package:flutter/material.dart';
import 'package:grafu/components/link_redirect/index.dart';
import 'package:grafu/components/screener/index.dart';
import 'package:grafu/styles/color.dart';

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
    return const SafeArea(
      child: Scaffold(
        body: Screener(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Email para resetar a senha foi enviado.',
                style: TextStyle(color: mainText),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Cheque o seu email.',
                style: TextStyle(color: mainText),
              ),
            ),
            Align(
              child: LinkRedirect(
                title: 'Voltar para login',
                redirectLink: '/login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
