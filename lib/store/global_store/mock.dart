import 'package:grafu/mocks/participant.dart';
import 'package:grafu/mocks/playday.dart';
import 'package:grafu/store/global_store/state.dart';
import 'package:grafu/store/global_store/store.dart';

class MockGlobalStore extends IGlobalStore {
  MockGlobalStore()
      : super(SuccessGlobalState(
          MakePlayday.make(),
          MakeParticipants.make(),
        ));

  @override
  Future fetch() async {}
}
