import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/index.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store.dart';

class ProfilePageContainer extends StatelessWidget {
  final IGlobalStore store;

  const ProfilePageContainer({Key? key, required this.store}) : super(key: key);

  Widget buildImage(BuildContext context, String image) => ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: NetworkImage(image),
            fit: BoxFit.cover,
            width: 128,
            height: 128,
            child: InkWell(
              onTap: () => BuildUpdatePhotoPopup.showMyDialog(context),
            ),
          ),
        ),
      );

  Widget buildEditIcon(BuildContext context) => InkWell(
        onTap: () => BuildUpdatePhotoPopup.showMyDialog(context),
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
    final state = store.value as SuccessGlobalState;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  buildImage(context, state.user.avatar),
                  Positioned(
                    bottom: 0,
                    right: 8,
                    child: buildEditIcon(context),
                  ),
                ],
              ),
            ),
            Text(
              state.user.name,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(state.user.email),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.0, color: Colors.pink.shade200),
              ),
              onPressed: () {
                Modular.to.navigate('/');
              },
              label:
                  Icon(Icons.logout, color: Colors.pink.shade200, size: 16.0),
              icon: Text(
                'Fazer logout',
                style: TextStyle(color: Colors.pink.shade200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
