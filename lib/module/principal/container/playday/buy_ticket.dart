import 'package:flutter/material.dart';
import 'package:grafu/styles/color.dart';
import 'package:url_launcher/link.dart';

class BuyTicket extends StatelessWidget {
  const BuyTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizedBox(
            width: double.maxFinite,
            child: Link(
              uri: Uri.parse('https://buy.stripe.com/test_6oE3cSdzg4yDc7efYY'),
              builder: (_, followLink) {
                return ElevatedButton.icon(
                  icon: const Icon(Icons.confirmation_number, size: 15.0),
                  onPressed: followLink,
                  label: const Text(
                    'Reservar Ingresso',
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 0.0)),
                    backgroundColor: MaterialStateProperty.all(mainOrange),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
