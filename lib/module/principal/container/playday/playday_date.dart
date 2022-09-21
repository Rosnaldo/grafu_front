import 'package:flutter/material.dart';
import 'package:grafu/styles/color.dart';

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
        Flexible(
          child: Text(
            date,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: mainText,
            ),
          ),
        ),
      ],
    );
  }
}
