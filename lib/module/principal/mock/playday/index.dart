import 'package:flutter/material.dart';
import 'package:grafu/mocks/participant.dart';
import 'package:grafu/module/principal/business/playday/participant_card/mock.dart';
import 'package:grafu/module/principal/business/playday/participant_detail_popup/mock.dart';
import 'package:grafu/module/principal/container/playday/index.dart';
import 'package:grafu/store/global_store/mock.dart';
import 'package:grafu/store/signin_store/mock.dart';

class MockPlaydayPage extends StatelessWidget {
  const MockPlaydayPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlaydayPageContainer(
      store: MockGlobalStore(),
      signinStore: MockSigninStore(),
      participantCard: (participant) => MockParticipantCard(
        participant: MakeParticipants.make()[0],
        buildParticipantDetailPopup: MockBuildParticipantDetailPopup(),
      ),
    );
  }
}
