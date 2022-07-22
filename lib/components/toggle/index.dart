import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
  const Toggle({
    Key? key,
  }) : super(key: key);

  @override
  State<Toggle> createState() => ToggleState();
}

class ToggleState extends State<Toggle> {
  bool select = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          thumbColor: MaterialStateProperty.all(Colors.purpleAccent),
          trackColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
          value: select,
          onChanged: (bool value) {
            setState(() {
              select = value;
            });
          },
        ),
      ],
    );
  }
}
