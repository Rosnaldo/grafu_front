import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/business/playday/participant_card/index.dart';
import 'package:grafu/module/principal/business/playday/participant_detail_popup/index.dart';
import 'package:grafu/module/principal/container/playday/index.dart';
import 'package:grafu/store/global_store.dart';

class PlaydayPage extends StatelessWidget {
  const PlaydayPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<GlobalStore>();

    return PlaydayPageContainer(
      store: store,
      participantCard: (participant) => ParticipantCard(
        participant: participant,
        buildParticipantDetailPopup: BuildParticipantDetailPopup(),
      ),
    );
  }
}
