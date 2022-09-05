import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/store/is_invited_store/is_invited_store.dart';
import 'package:grafu/store/signin_store/index.dart';

class IsInvitedMessage extends StatelessWidget {
  const IsInvitedMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isInvitedStore = Modular.get<IsInvitedStore>();
    final signinStore = Modular.get<ISigninStore>();

    if (!signinStore.isSignin) {
      return const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text('Você não está logado.',
            style: TextStyle(color: Colors.redAccent)),
      );
    }
    if (isInvitedStore.getIsInvited()) {
      return Container();
    } else {
      return const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text('Você não está na lista de convidados para o evento.',
            style: TextStyle(color: Colors.redAccent)),
      );
    }
  }
}
