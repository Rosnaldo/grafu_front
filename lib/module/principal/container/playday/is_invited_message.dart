import 'package:flutter/material.dart';
import 'package:grafu/store/is_invited_store/is_invited_store.dart';
import 'package:grafu/store/signin_store/index.dart';
import 'package:grafu/styles/color.dart';

class IsInvitedMessage extends StatelessWidget {
  final IIsInvitedStore isInvitedStore;
  final ISigninStore signinStore;

  const IsInvitedMessage({
    Key? key,
    required this.isInvitedStore,
    required this.signinStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!signinStore.isSignin) {
      return const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text('Você não está logado.', style: TextStyle(color: alertRed)),
      );
    }
    if (isInvitedStore.getIsInvited()) {
      return Container();
    } else {
      return const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text('Você não está na lista de convidados para o evento.',
            style: TextStyle(color: alertRed)),
      );
    }
  }
}
