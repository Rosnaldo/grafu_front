import 'package:grafu/store/is_invited_store/is_invited_store.dart';

class MockIsInvitedStore extends IIsInvitedStore {
  MockIsInvitedStore() : super();

  @override
  getIsInvited() {
    return false;
  }

  @override
  setIsInvited(bool i) {}
}
