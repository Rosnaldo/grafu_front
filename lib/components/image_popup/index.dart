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
              child: Stack(
                children: [
                  Image.network(
                    image,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white.withOpacity(0.45),
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.black),
                          iconSize: 15,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}