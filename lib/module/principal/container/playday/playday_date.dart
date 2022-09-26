import 'package:flutter/material.dart';
import 'package:grafu/models/address.dart';
import 'package:grafu/styles/color.dart';
import 'package:grafu/styles/font_family.dart';

class PlaydayDate extends StatelessWidget {
  final String date;
  final Address address;

  const PlaydayDate({
    Key? key,
    required this.date,
    required this.address,
  }) : super(key: key);

  String showLocation(Address address) {
    final city = address.city;
    final state = address.state;
    return '$city / $state';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(
            fontSize: 15.0,
            letterSpacing: 0.5,
            color: mainPink,
            fontFamily: mainFontText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            showLocation(address),
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              color: mainStrongText,
              fontFamily: mainFontText,
            ),
          ),
        ),
      ],
    );
  }
}
