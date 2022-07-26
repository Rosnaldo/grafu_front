import 'package:flutter/material.dart';
import 'package:grafu/module/principal/container/playday/section_title.dart';
import 'package:grafu/styles/color.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(height: 30.0),
          SectionTitle(title: 'Descrição'),
          SizedBox(height: 12.0),
          Text(
            '''
Final de semana junto aos amigos na chácara do Kintana com bastante natureza e ar fresco longe da cidade.
Já está incluso café da manhã, almoço, janta.
Nas acomodações temos quartos individuais para dormir, chuveiro elétrico e banheiro.
Piscina e churrasqueira poderam ser usadas à vontade.
Você terá o direito de convidar amigos se quiser.
Divirta-se.
''',
            style: TextStyle(color: mainText),
          ),
        ],
      ),
    );
  }
}
