import 'package:flutter/material.dart';
import 'package:grafu/styles/color.dart';
import 'package:grafu/styles/font_family.dart';

class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 25.0,
              fontFamily: mainFontText,
              fontWeight: FontWeight.w600,
              color: mainPink,
            ),
          ),
        ),
      ],
    );
  }
}
