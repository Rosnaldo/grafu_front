import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({
    Key? key,
  }) : super(key: key);

  final district = 'Alphaville / Lagoa dos Ingleses';
  final street = 'Av. Picadilly';
  final city = 'Nova Lima';
  final state = 'MG';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Local',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          children: [
            Text(district,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
        Row(
          children: [
            Text(street),
          ],
        ),
        Row(
          children: [
            Text('$city,'),
            const SizedBox(width: 10.0),
            Text(state),
          ],
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.map, size: 15.0),
          onPressed: () => {},
          label: const Text(
            'Ver mapa',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0)),
            backgroundColor: MaterialStateProperty.all(Colors.pink.shade200),
          ),
        ),
      ],
    );
  }
}
