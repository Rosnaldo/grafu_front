import 'package:flutter/material.dart';

import 'package:grafu/models/invited.dart';
import 'package:grafu/module/principal/container/playday/invited_card.dart';

class BuildInvitedsPopup {
  static Future<Future<Object?>> showMyDialog(
    BuildContext context,
    List<Invited> inviteds,
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 20,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SingleChildScrollView(
                      child: ListBody(
                        children: inviteds
                            .map(
                              (invited) => InvitedCard(
                                name: invited.name,
                                avatar: invited.avatar,
                                status: invited.status,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
