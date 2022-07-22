import 'package:flutter/material.dart';

import 'package:grafu/models/invited.dart';
import 'package:grafu/pages/playday/buy_ticket.dart';
import 'package:grafu/pages/playday/playday_date.dart';
import 'package:grafu/pages/playday/footer.dart';
import 'package:grafu/pages/playday/invited_list.dart';
import 'package:grafu/pages/playday/line.dart';
import 'package:grafu/pages/playday/location.dart';
import 'package:grafu/pages/playday/see_gallery.dart';
import 'package:grafu/pages/playday/timeline.dart';

import 'carousel.dart';

class PlaydayPage extends StatelessWidget {
  PlaydayPage({Key? key}) : super(key: key);

  final List<Invited> inviteds = [
    Invited(
      name: 'Joaninha da Cunha',
      avatar:
          'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
      status: 'Confirmado',
    ),
    Invited(
      name: 'Joaninha da Cunha',
      avatar:
          'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
      status: 'Confirmado',
    ),
    Invited(
      name: 'Joaninha da Cunha',
      avatar:
          'https://media-exp1.licdn.com/dms/image/C4D03AQFXAsqjqMZjSw/profile-displayphoto-shrink_800_800/0/1598561454891?e=1663200000&v=beta&t=d9HE6iKFhvYYZV2iPLDQIeLfVK2vjuURE1acSOKN2s0',
      status: 'Confirmado',
    ),
  ];

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Carousel(imgList: imgList),
              const SizedBox(height: 4.0),
              const SeeGallery(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const PlaydayDate(),
                    const Line(),
                    InvitedList(),
                    const Line(),
                    const Location(),
                    const Line(),
                    Row(
                      children: const [
                        Text(
                          'Ingresso',
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    const PlaydayTimeline(),
                    const SizedBox(height: 15.0),
                    const BuyTicket(),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
