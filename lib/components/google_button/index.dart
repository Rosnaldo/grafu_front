import 'package:flutter/material.dart';
import 'package:grafu/styles/color.dart';

class GoogleButton extends StatelessWidget {
  final void Function() onPressed;
  const GoogleButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
          backgroundColor: MaterialStateProperty.all(mainBackGroundPink),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(
                color: Color.fromRGBO(80, 85, 92, 1),
                width: 1.7,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage('assets/google.png'), height: 23.0),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'ENTRAR COM GOOGLE',
                style: TextStyle(color: Color.fromRGBO(80, 85, 92, 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
