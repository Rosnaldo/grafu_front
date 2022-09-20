import 'package:flutter/material.dart';

class Screener extends StatelessWidget {
  final List<Widget> children;
  const Screener({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: 400.0,
                    child: Column(children: children),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
