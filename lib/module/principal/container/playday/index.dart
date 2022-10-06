import 'package:flutter/material.dart';
import 'package:grafu/components/fosted_glass_box/index.dart';
import 'package:grafu/components/image_cache/index.dart';
import 'package:grafu/components/screener/index.dart';
import 'package:grafu/models/participant.dart';

import 'package:grafu/module/principal/container/playday/buy_ticket.dart';
import 'package:grafu/module/principal/container/playday/description.dart';
import 'package:grafu/module/principal/container/playday/conveniences.dart';
import 'package:grafu/module/principal/container/playday/is_invited_message.dart';
import 'package:grafu/module/principal/container/playday/participant_list.dart';
import 'package:grafu/module/principal/container/playday/location.dart';
import 'package:grafu/module/principal/container/playday/timeline.dart';
import 'package:grafu/store/global_store/state.dart';
import 'package:grafu/store/global_store/store.dart';
import 'package:grafu/store/is_invited_store/is_invited_store.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';
import 'package:grafu/store/signin_store/index.dart';
import 'package:grafu/store/user_store/user_store.dart';

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
        Stack(
          children: [
            Image(
              image: BuildImageCache.build(
                url: state.playday.gallery[0],
              ),
              height: MediaQuery.of(context).size.height * 0.8,
              fit: BoxFit.fitHeight,
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.50,
              child: Align(
                alignment: Alignment.center,
                child: FrostedGlassBox(
                  theWidth: 280.0,
                  theHeight: 160.0,
                  theChild: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Stack(
                                children: [
                                  Image(
                                    image: BuildImageCache.build(
                                      url: state.playday.gallery[0],
                                    ),
                                    height: 60.0,
                                    width: 60.0,
                                    fit: BoxFit.fill,
                                  ),
                                  Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color:
                                              Colors.white.withOpacity(0.13)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            //begin color
                                            Colors.white.withOpacity(0.35),
                                            //end color
                                            Colors.white.withOpacity(0.15),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Domingo 23, Março 2023',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'Nova Lima / MG',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Divider(thickness: 1, color: Colors.white),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Stack(
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  color: Colors.transparent,
                                  child: const Center(
                                    child: Icon(Icons.directions_car_filled,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.13)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        //begin color
                                        Colors.white.withOpacity(0.55),
                                        //end color
                                        Colors.white.withOpacity(0.35),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Stack(
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  color: Colors.transparent,
                                  child: const Center(
                                    child: Icon(Icons.restaurant_menu,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.13)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        //begin color
                                        Colors.white.withOpacity(0.55),
                                        //end color
                                        Colors.white.withOpacity(0.35),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Stack(
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  color: Colors.transparent,
                                  child: const Center(
                                    child: Icon(
                                        Icons.airline_seat_individual_suite,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.13)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        //begin color
                                        Colors.white.withOpacity(0.55),
                                        //end color
                                        Colors.white.withOpacity(0.35),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Stack(
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  color: Colors.transparent,
                                  child: const Center(
                                    child:
                                        Icon(Icons.wifi, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.13)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        //begin color
                                        Colors.white.withOpacity(0.55),
                                        //end color
                                        Colors.white.withOpacity(0.35),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Column(
          children: [
            // PlaydayDate(
            //     date: state.playday.date, address: state.playday.address),
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
            const SizedBox(height: 35.0),
            // Invite(),
            // const SizedBox(height: 15.0),
            (signinStore.isSignin()) ? const BuyTicket() : Container(),
            const SizedBox(height: 45.0),
          ],
        ),
      ],
    );
  }
}
