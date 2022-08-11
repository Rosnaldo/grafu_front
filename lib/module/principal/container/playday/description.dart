import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  State<Description> createState() => DescriptionState();
}

class DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Descrição',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        const Text(
          '''
Final de semana junto aos amigos na chácara do Kintana com bastante natureza e ar fresco longe da cidade.
Já está incluso café da manhã, almoço, janta.
Nas acomodações temos quartos individuais para dormir, chuveiro elétrico e banheiro.
Piscina e churrasqueira poderam ser usadas à vontade.
Você terá o direito de convidar amigos se quiser.
Divirta-se.
''',
        ),
      ],
    );
  }
}
