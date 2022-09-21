import 'package:flutter/material.dart';
import 'package:grafu/components/link_redirect/index.dart';
import 'package:grafu/components/screener/index.dart';
import 'package:grafu/components/title/index.dart';
import 'package:grafu/styles/color.dart';

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
      child: Scaffold(
        body: Screener(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: PageTitle(title: 'Verificação de Email'),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Um email de ativação de conta foi enviado.',
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
                redirectLink: '/',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
