import 'package:grafu/mocks/participant.dart';
import 'package:grafu/mocks/playday.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store/index.dart';

class MockGlobalStore extends IGlobalStore {
  MockGlobalStore()
      : super(SuccessGlobalState(
          MakePlayday.make(),
          MakeParticipants.make(),
        ));

  @override
  Future fetch() async {}
}
