import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Contato:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'email: andreytsuzuki@gmail.com',
              style: TextStyle(color: Colors.white, fontSize: 11.0),
            ),
            Text(
              'whats: (11) 93936-0400',
              style: TextStyle(color: Colors.white, fontSize: 11.0),
            ),
            Divider(thickness: 0.5, color: Colors.white12),
            Text(
              '© Copyright 2022',
              style: TextStyle(color: Colors.white, fontSize: 11.0),
            )
          ],
        ),
      ),
    );
  }
}
