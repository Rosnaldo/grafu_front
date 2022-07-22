import 'package:flutter/material.dart';

class PlaydayDate extends StatelessWidget {
  const PlaydayDate({
    Key? key,
  }) : super(key: key);

  final String playdayDate =
      '10 de julho de 2022, 15h - 14 de agosto de 2022, 19h';

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
            playdayDate,
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
