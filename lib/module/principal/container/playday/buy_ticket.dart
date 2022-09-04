import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class BuyTicket extends StatelessWidget {
  final int price;

  const BuyTicket({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Valor:'),
            Text(
              'R\$ ${price.toString()}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        Link(
            uri: Uri.parse('https://buy.stripe.com/test_6oE3cSdzg4yDc7efYY'),
            builder: (_, followLink) {
              return ElevatedButton(
                onPressed: followLink,
                child: const Text('Reservar'),
              );
            })
      ],
    );
  }
}
