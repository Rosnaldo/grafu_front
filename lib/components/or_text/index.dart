import 'package:flutter/material.dart';

class OrText extends StatelessWidget {
  const OrText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100.0,
            height: 1.0,
            color: const Color.fromRGBO(172, 179, 191, 1),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('ou'),
          ),
          Container(
            width: 100.0,
            height: 1.0,
            color: const Color.fromRGBO(172, 179, 191, 1),
          ),
        ],
      ),
    );
  }
}
