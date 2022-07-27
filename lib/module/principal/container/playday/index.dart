import 'package:flutter/material.dart';

import 'package:grafu/module/principal/container/playday/buy_ticket.dart';
import 'package:grafu/module/principal/container/playday/playday_date.dart';
import 'package:grafu/module/principal/container/playday/footer.dart';
import 'package:grafu/module/principal/container/playday/invited_list.dart';
import 'package:grafu/module/principal/container/playday/line.dart';
import 'package:grafu/module/principal/container/playday/location.dart';
import 'package:grafu/module/principal/container/playday/timeline.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store.dart';

import 'carousel.dart';

class PlaydayPageContainer extends StatelessWidget {
  final IGlobalStore store;
  const PlaydayPageContainer({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = store.value as SuccessGlobalState;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Carousel(imgList: state.playday.gallery),
            const SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  PlaydayDate(date: state.playday.date),
                  const Line(),
                  InvitedList(inviteds: state.inviteds),
                  const Line(),
                  Location(address: state.playday.address),
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
                  PlaydayTimeline(playday: state.playday),
                  const SizedBox(height: 15.0),
                  BuyTicket(price: state.playday.firstLot.price),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
