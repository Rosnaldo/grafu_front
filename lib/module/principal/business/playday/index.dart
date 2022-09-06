import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/business/playday/participant_card/index.dart';
import 'package:grafu/module/principal/business/playday/participant_detail_popup/index.dart';
import 'package:grafu/module/principal/container/playday/index.dart';
import 'package:grafu/store/global_store/store.dart';
import 'package:grafu/store/is_invited_store/is_invited_store.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';
import 'package:grafu/store/signin_store/index.dart';
import 'package:grafu/store/user_store/user_store.dart';

class PlaydayPage extends StatelessWidget {
  const PlaydayPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<GlobalStore>();
    final signinStore = Modular.get<SigninStore>();
    final userStore = Modular.get<UserStore>();
    final isInvitedStore = Modular.get<IsInvitedStore>();
    final myParticipantStore = Modular.get<MyParticipantStore>();

    return PlaydayPageContainer(
      store: store,
      signinStore: signinStore,
      userStore: userStore,
      isInvitedStore: isInvitedStore,
      myParticipantStore: myParticipantStore,
      participantCard: (participant) => ParticipantCard(
        participant: participant,
        buildParticipantDetailPopup: BuildParticipantDetailPopup(),
      ),
    );
  }
}
