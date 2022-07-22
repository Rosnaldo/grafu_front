import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:grafu/components/toggle/index.dart';
import 'package:grafu/components/switch_button/index.dart';

import 'package:grafu/pages/gallery/index.dart';
import 'package:grafu/pages/playday/inviteds_popup/index.dart';
import 'package:grafu/pages/profile/update_photo_popup/index.dart';
import 'package:grafu/pages/playday/invited_card.dart';
import 'package:grafu/pages/playday/carousel.dart';
import 'package:grafu/pages/playday/index.dart';
import 'package:grafu/pages/profile/index.dart';
import 'package:grafu/pages/login/index.dart';
import 'package:grafu/pages/register/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeWidget());
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: [
        Story(
          name: 'Login',
          builder: (context) => LoginPage(),
        ),
        Story(
          name: 'Register',
          builder: (context) => RegisterPage(),
        ),
        Story(
          name: 'Profile',
          builder: (context) => const ProfilePage(),
        ),
        Story(
          name: 'Playday',
          builder: (context) => PlaydayPage(),
        ),
        Story(
          name: 'Gallery',
          builder: (context) => GalleryPage(),
        ),
        Story(
          name: 'Toggle',
          builder: (context) => const Toggle(),
        ),
        Story(
          name: 'UpdatePhotoPopup',
          builder: (context) => const UpdatePhotoPopup(),
        ),
        Story(
          name: 'InvitedsPopup',
          builder: (context) => const InvitedsPopup(),
        ),
        Story(
          name: 'SwitchButton',
          builder: (context) => SwitchButton(
            option1: SwitchButtonOption(label: 'masculino', icon: Icons.male),
            option2: SwitchButtonOption(label: 'feminino', icon: Icons.female),
            isSelected: const [true, false],
          ),
        ),
        Story(
          name: 'Carousel',
          builder: (context) => const Carousel(
            imgList: [
              'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
              'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
              'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
              'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
              'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
              'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
            ],
          ),
        ),
        Story(
          name: 'Invited Card',
          builder: (context) => const InvitedCard(
            name: 'Joaninha da Cunha',
            avatar:
                'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
            status: 'Confirmado',
          ),
        ),
      ],
    );
  }
}
