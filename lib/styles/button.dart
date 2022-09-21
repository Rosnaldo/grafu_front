import 'package:flutter/material.dart';
import 'package:grafu/styles/color.dart';

class MainPinkButton extends StatelessWidget {
  final FocusNode focusNode;
  final void Function() onPressed;
  final Widget child;

  const MainPinkButton({
    Key? key,
    required this.focusNode,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(mainPink),
        padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      focusNode: focusNode,
      onPressed: onPressed,
      child: child,
    );
  }
}
