import 'package:flutter/material.dart';
import 'package:grafu/models/address.dart';

import 'package:grafu/models/invited.dart';
import 'package:grafu/models/lot.dart';
import 'package:grafu/models/playday.dart';
import 'package:grafu/module/principal/playday/buy_ticket.dart';
import 'package:grafu/module/principal/playday/playday_date.dart';
import 'package:grafu/module/principal/playday/footer.dart';
import 'package:grafu/module/principal/playday/invited_list.dart';
import 'package:grafu/module/principal/playday/line.dart';
import 'package:grafu/module/principal/playday/location.dart';
import 'package:grafu/module/principal/playday/timeline.dart';

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

  final playday = Playday(
    date: '10 de julho de 2022, 15h - 14 de agosto de 2022, 19h',
    address: Address(
      district: 'Alphaville / Lagoa dos Ingleses',
      street: 'Av. Picadilly',
      city: 'Nova Lima',
      state: 'MG',
    ),
    firstLot: Lot(
      price: 10.0,
      vacancyExistent: 10,
      vacancyFilled: 2,
    ),
    secoundLot: Lot(
      price: 20.0,
      vacancyExistent: 10,
      vacancyFilled: 0,
    ),
    thirdLot: Lot(
      price: 30.0,
      vacancyExistent: 10,
      vacancyFilled: 0,
    ),
    gallery: [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Carousel(imgList: playday.gallery),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    PlaydayDate(date: playday.date),
                    const Line(),
                    InvitedList(),
                    const Line(),
                    Location(address: playday.address),
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
                    PlaydayTimeline(playday: playday),
                    const SizedBox(height: 15.0),
                    BuyTicket(price: playday.firstLot.price),
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
