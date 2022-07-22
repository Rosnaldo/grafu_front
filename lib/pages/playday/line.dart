import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 8.0),
        Divider(thickness: 1),
        SizedBox(height: 13.0),
      ],
    );
  }
}
