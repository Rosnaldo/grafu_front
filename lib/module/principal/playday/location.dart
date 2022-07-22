import 'package:flutter/material.dart';
import 'package:grafu/models/address.dart';

class Location extends StatelessWidget {
  final Address address;

  const Location({
    Key? key,
    required this.address,
  }) : super(key: key);

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
            Text(address.district,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
        Row(
          children: [
            Text(address.street),
          ],
        ),
        Row(
          children: [
            Text('${address.city},'),
            const SizedBox(width: 10.0),
            Text(address.state),
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
