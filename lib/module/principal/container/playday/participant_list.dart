import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grafu/components/avatar/index.dart';
import 'package:grafu/models/participant.dart';
import 'package:grafu/module/principal/business/playday/participants_popup/index.dart';
import 'package:grafu/module/principal/container/playday/line.dart';
import 'package:grafu/module/principal/container/playday/section_title.dart';
import 'package:grafu/store/is_invited_store/is_invited_store.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';
import 'package:grafu/store/signin_store/index.dart';
import 'package:grafu/store/user_store/user_store.dart';
import 'package:grafu/styles/color.dart';
import 'package:grafu/styles/font_family.dart';

class ParticipantList extends StatelessWidget {
  final List<Participant> participants;
  final Widget Function(Participant participant) participantCard;
  final ISigninStore signinStore;
  final IUserStore userStore;
  final IIsInvitedStore isInvitedStore;
  final IMyParticipantStore myParticipantStore;

  const ParticipantList({
    Key? key,
    required this.participants,
    required this.participantCard,
    required this.signinStore,
    required this.userStore,
    required this.isInvitedStore,
    required this.myParticipantStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Line(),
        const SectionTitle(title: 'Convidados'),
        const SizedBox(height: 12.0),
        Column(children: [
          Observer(builder: (_) {
            if (isInvitedStore.getIsInvited() && signinStore.isSignin) {
              return participantCard(myParticipantStore.getMyParticipant());
            }
            return Container();
          }),
          ...participants
              .map(
                (participant) => participantCard(participant),
              )
              .toList()
        ]),
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () => {
            BuildParticipantsPopup.showMyDialog(
                context, participants, participantCard),
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Ver convidados',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: confirmedGreen,
                    fontFamily: mainFontText,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 83,
                    child: Row(
                      children: [
                        AvatarWidget(
                          avatar: userStore.getUser().avatar,
                          size: 32,
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 25,
                    child: AvatarWidget(
                      avatar: userStore.getUser().avatar,
                      size: 32,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 50,
                    child: AvatarWidget(
                      avatar: userStore.getUser().avatar,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
