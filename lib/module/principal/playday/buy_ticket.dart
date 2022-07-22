import 'package:flutter/material.dart';

class BuyTicket extends StatelessWidget {
  final double price;

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
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1.0, color: Colors.pink.shade200),
          ),
          onPressed: () => {},
          child: Text(
            'Reservar ingresso',
            style: TextStyle(color: Colors.pink.shade200),
          ),
        ),
      ],
    );
  }
}
