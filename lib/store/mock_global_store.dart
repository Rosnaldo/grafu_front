import 'package:grafu/mocks/member.dart';
import 'package:grafu/mocks/playday.dart';
import 'package:grafu/mocks/user.dart';
import 'package:grafu/state/global_state.dart';
import 'package:grafu/store/global_store.dart';

class MockGlobalStore extends IGlobalStore {
  MockGlobalStore()
      : super(SuccessGlobalState(
          MakeUser.make(),
          MakePlayday.make(),
          MakeMembers.make(),
        ));

  @override
  Future fetch() async {}
}
