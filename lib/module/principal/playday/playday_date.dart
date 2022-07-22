import 'package:flutter/material.dart';

class PlaydayDate extends StatelessWidget {
  final String date;

  const PlaydayDate({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.access_time, size: 20.0),
        const SizedBox(width: 5.0),
        Flexible(
          child: Text(
            date,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
