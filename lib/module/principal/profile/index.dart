import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/profile/update_photo_popup/index.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  final String image =
      'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0';
  final String name = 'Andrey K Tsuzuki';
  final String email = 'andreytsuzuki@gmail.com';

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
                  buildImage(context, image),
                  Positioned(
                    bottom: 0,
                    right: 8,
                    child: buildEditIcon(context),
                  ),
                ],
              ),
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(email),
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
