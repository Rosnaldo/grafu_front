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
import 'package:grafu/styles/color.dart';

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
      return (signinStore.isSignin())
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
              ElevatedButton.icon(
                icon: const Icon(Icons.logout, size: 15.0),
                onPressed: () async {
                  await signOut.execute();
                  Modular.to.navigate('/');
                },
                label: const Text(
                  'Fazer logout',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 0.0)),
                  backgroundColor: MaterialStateProperty.all(mainOrange),
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
              ElevatedButton.icon(
                icon: const Icon(Icons.logout, size: 15.0),
                onPressed: () {
                  Modular.to.navigate('/');
                },
                label: const Text(
                  'Fazer login',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 0.0)),
                  backgroundColor: MaterialStateProperty.all(mainOrange),
                ),
              ),
            ];
    }

    return Screener(
      children: signedWidgets(),
    );
  }
}
