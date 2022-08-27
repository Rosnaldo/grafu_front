import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/models/participant.dart';

import 'package:grafu/module/principal/container/playday/buy_ticket.dart';
import 'package:grafu/module/principal/container/playday/description.dart';
import 'package:grafu/module/principal/container/playday/invite.dart';
import 'package:grafu/module/principal/container/playday/conveniences.dart';
import 'package:grafu/module/principal/container/playday/playday_date.dart';
import 'package:grafu/module/principal/container/playday/footer.dart';
import 'package:grafu/module/principal/container/playday/participant_list.dart';
import 'package:grafu/module/principal/container/playday/line.dart';
import 'package:grafu/module/principal/container/playday/location.dart';
import 'package:grafu/module/principal/container/playday/timeline.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store.dart';
import 'package:grafu/store/login_store.dart';

import 'carousel.dart';

class PlaydayPageContainer extends StatelessWidget {
  final IGlobalStore store;
  final Widget Function(Participant participant) participantCard;

  const PlaydayPageContainer({
    Key? key,
    required this.store,
    required this.participantCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = store.value as SuccessGlobalState;
    final loginStore = Modular.get<LoginStore>();

    int findLoggedParticipant(List<Participant> list) {
      return list.indexWhere((p) => p.email == loginStore.email);
    }

    List<Participant> orderParticipants(List<Participant> list) {
      final int index = findLoggedParticipant(list);

      if (index == -1) {
        return list;
      }

      return [
        list[index],
        ...list.sublist(0, index),
        ...list.sublist(index + 1, list.length),
      ];
    }

    return Scaffold(
      body: SafeArea(
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
                    const Description(),
                    const Line(),
                    ParticipantList(
                      participants: orderParticipants(state.participants),
                      participantCard: participantCard,
                    ),
                    const Line(),
                    Conveniences(
                      conveniences: state.playday.conveniences,
                    ),
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
                    const SizedBox(height: 12.0),
                    const Line(),
                    Invite(),
                    const SizedBox(height: 15.0),
                    const Line(),
                    BuyTicket(price: state.playday.firstLot.price),
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
