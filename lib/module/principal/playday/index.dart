import 'package:flutter/material.dart';
import 'package:grafu/mocks/invited.dart';

import 'package:grafu/mocks/playday.dart';
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
  final playday = MakePlayday.make();
  final inviteds = MakeInviteds.make();

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
                    InvitedList(inviteds: inviteds),
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
