import 'package:flutter/material.dart';
import 'package:grafu/styles/color.dart';
import 'package:grafu/styles/font_family.dart';

class MainPinkButton extends StatelessWidget {
  final FocusNode? focusNode;
  final Function() onPressed;
  final String text;

  const MainPinkButton({
    Key? key,
    this.focusNode,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(mainPink),
        padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      focusNode: focusNode,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontFamily: mainFontText,
          fontSize: 17.0,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
