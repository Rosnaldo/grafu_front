import 'package:grafu/mocks/participant.dart';
import 'package:grafu/mocks/playday.dart';
import 'package:grafu/mocks/user.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store.dart';

class MockGlobalStore extends IGlobalStore {
  MockGlobalStore()
      : super(SuccessGlobalState(
          MakeUser.make(),
          MakePlayday.make(),
          MakeParticipants.make(),
        ));

  @override
  Future fetch() async {}
}
