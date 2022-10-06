import 'package:flutter/material.dart';
import 'package:grafu/styles/color.dart';
import 'package:grafu/styles/font_family.dart';

class CadastrarLinkRedirect extends StatelessWidget {
  final String redirectLink;
  final String title;

  const CadastrarLinkRedirect({
    Key? key,
    required this.redirectLink,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(redirectLink);
      },
      style: TextButton.styleFrom(
        textStyle: const TextStyle(height: 1.0),
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        primary: mainOrange,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: mainFontText,
          height: 1.0,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
