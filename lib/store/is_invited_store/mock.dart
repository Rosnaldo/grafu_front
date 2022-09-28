import 'package:grafu/store/is_invited_store/is_invited_store.dart';

class MockIsInvitedStore implements IIsInvitedStore {
  @override
  getIsInvited() {
    return true;
  }

  @override
  setIsInvited(bool i) {}
}
