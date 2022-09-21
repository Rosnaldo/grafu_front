import 'package:flutter/material.dart';
import 'package:grafu/components/screener/index.dart';
import 'package:grafu/models/participant.dart';

import 'package:grafu/module/principal/container/playday/buy_ticket.dart';
import 'package:grafu/module/principal/container/playday/description.dart';
import 'package:grafu/module/principal/container/playday/conveniences.dart';
import 'package:grafu/module/principal/container/playday/is_invited_message.dart';
import 'package:grafu/module/principal/container/playday/playday_date.dart';
import 'package:grafu/module/principal/container/playday/footer.dart';
import 'package:grafu/module/principal/container/playday/participant_list.dart';
import 'package:grafu/module/principal/container/playday/line.dart';
import 'package:grafu/module/principal/container/playday/location.dart';
import 'package:grafu/module/principal/container/playday/timeline.dart';
import 'package:grafu/store/global_store/state.dart';
import 'package:grafu/store/global_store/store.dart';
import 'package:grafu/store/is_invited_store/is_invited_store.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';
import 'package:grafu/store/signin_store/index.dart';
import 'package:grafu/store/user_store/user_store.dart';

import 'carousel.dart';

class PlaydayPageContainer extends StatelessWidget {
  final IGlobalStore store;
  final ISigninStore signinStore;
  final Widget Function(Participant participant) participantCard;
  final IUserStore userStore;
  final IIsInvitedStore isInvitedStore;
  final IMyParticipantStore myParticipantStore;

  const PlaydayPageContainer({
    Key? key,
    required this.store,
    required this.participantCard,
    required this.signinStore,
    required this.userStore,
    required this.isInvitedStore,
    required this.myParticipantStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = store.value as SuccessGlobalState;

    return Screener(
      children: <Widget>[
        Carousel(imgList: state.playday.gallery),
        const SizedBox(height: 4.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PlaydayDate(date: state.playday.date),
              const Line(),
              IsInvitedMessage(
                isInvitedStore: isInvitedStore,
                signinStore: signinStore,
              ),
              const Description(),
              ParticipantList(
                participants: state.participants,
                participantCard: participantCard,
                signinStore: signinStore,
                userStore: userStore,
                isInvitedStore: isInvitedStore,
                myParticipantStore: myParticipantStore,
              ),
              Conveniences(
                conveniences: state.playday.conveniences,
              ),
              Location(address: state.playday.address),
              PlaydayTimeline(playday: state.playday),
              const SizedBox(height: 12.0),
              // const Line(),
              // Invite(),
              // const SizedBox(height: 15.0),
              const Line(),
              (signinStore.isSignin)
                  ? BuyTicket(price: state.playday.firstLot.price)
                  : Container(),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        const Footer(),
      ],
    );
  }
}
