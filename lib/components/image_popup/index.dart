import 'package:flutter/material.dart';

class BuildImagePopup {
  static Future<Future<Object?>> showMyDialog(
    BuildContext context,
    String image,
  ) async {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(microseconds: 200),
      pageBuilder: (BuildContext context, Animation first, Animation second) {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: Image.network(
                image,
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
              ),
            ),
          ),
        );
      },
    );
  }
}
