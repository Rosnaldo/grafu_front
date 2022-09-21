import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/components/avatar/index.dart';
import 'package:grafu/components/screener/index.dart';
import 'package:grafu/models/user.dart';
import 'package:grafu/services/signout/index.dart';
import 'package:grafu/store/global_store/store.dart';
import 'package:grafu/store/signin_store/index.dart';
import 'package:grafu/store/user_store/user_store.dart';

class ProfilePageContainer extends StatelessWidget {
  final IGlobalStore store;
  final ISignOut signOut;
  final Function onTapCb;
  final ISigninStore signinStore;
  final IUserStore userStore;

  const ProfilePageContainer({
    Key? key,
    required this.store,
    required this.signOut,
    required this.onTapCb,
    required this.signinStore,
    required this.userStore,
  }) : super(key: key);

  Widget buildEditIcon(BuildContext context, User user) => InkWell(
        onTap: () => onTapCb(context, user),
        child: buildCircle(
          color: Colors.white,
          all: 1.5,
          child: buildCircle(
            color: Colors.blue,
            all: 7,
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 12,
            ),
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    List<Widget> signedWidgets() {
      return (signinStore.isSignin)
          ? [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Observer(builder: (_) {
                  return Stack(
                    children: [
                      AvatarWidget(
                        avatar: userStore.getUser().avatar,
                        onTap: () => onTapCb(context, userStore.getUser()),
                        size: 128,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 8,
                        child: buildEditIcon(context, userStore.getUser()),
                      ),
                    ],
                  );
                }),
              ),
              Text(
                userStore.getUser().name,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(userStore.getUser().email),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: Colors.pink.shade200),
                ),
                onPressed: () async {
                  await signOut.execute();
                  Modular.to.navigate('/');
                },
                label:
                    Icon(Icons.logout, color: Colors.pink.shade200, size: 16.0),
                icon: Text(
                  'Fazer logout',
                  style: TextStyle(color: Colors.pink.shade200),
                ),
              ),
            ]
          : [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Observer(builder: (_) {
                  return Stack(
                    children: const [
                      AvatarWidget(
                        size: 128,
                      ),
                    ],
                  );
                }),
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: Colors.pink.shade200),
                ),
                onPressed: () async {
                  await signOut.execute();
                  Modular.to.navigate('/');
                },
                label:
                    Icon(Icons.logout, color: Colors.pink.shade200, size: 16.0),
                icon: Text(
                  'Fazer login',
                  style: TextStyle(color: Colors.pink.shade200),
                ),
              ),
            ];
    }

    return Screener(
      children: signedWidgets(),
    );
  }
}
