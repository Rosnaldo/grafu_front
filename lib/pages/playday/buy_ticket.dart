import 'package:flutter/material.dart';

class BuyTicket extends StatelessWidget {
  const BuyTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text('Valor:'),
            Text(
              'R\$ 30',
              style: TextStyle(
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
