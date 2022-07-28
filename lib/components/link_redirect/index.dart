import 'package:flutter/material.dart';

class LinkRedirect extends StatelessWidget {
  final String redirectLink;
  final String title;

  const LinkRedirect({
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
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        alignment: Alignment.centerLeft,
        primary: Colors.pink,
      ),
      child: Text(
        title,
        style: const TextStyle(
          height: 1.0,
          fontSize: 15.0,
        ),
      ),
    );
  }
}
