import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/models/user.dart';
import 'package:grafu/services/signout/index.dart';
import 'package:grafu/store/global_store.dart';
import 'package:grafu/store/login_store.dart';
import 'package:grafu/store/user_store.dart';

class ProfilePageContainer extends StatelessWidget {
  final IGlobalStore store;
  final ISignOut signOut;
  final Function onTapCb;

  const ProfilePageContainer({
    Key? key,
    required this.store,
    required this.signOut,
    required this.onTapCb,
  }) : super(key: key);

  Widget buildNoAvatar() => ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: const NetworkImage(
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
            ),
            fit: BoxFit.cover,
            width: 128,
            height: 128,
          ),
        ),
      );

  Widget buildAvatar(BuildContext context, User user) => ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: NetworkImage(user.avatar ??
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),
            fit: BoxFit.cover,
            width: 128,
            height: 128,
            child: InkWell(
              onTap: () => onTapCb(context, user),
            ),
          ),
        ),
      );

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
    final userStore = Modular.get<UserStore>();
    final loginStore = Modular.get<LoginStore>();

    List<Widget> signedWidgets() {
      return (loginStore.isSigned)
          ? [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Observer(builder: (_) {
                  return Stack(
                    children: [
                      buildAvatar(context, userStore.user),
                      Positioned(
                        bottom: 0,
                        right: 8,
                        child: buildEditIcon(context, userStore.user),
                      ),
                    ],
                  );
                }),
              ),
              Text(
                userStore.user.name,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(userStore.user.email),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Observer(builder: (_) {
                  return Stack(
                    children: [
                      buildNoAvatar(),
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: signedWidgets(),
          ),
        ),
      ),
    );
  }
}
