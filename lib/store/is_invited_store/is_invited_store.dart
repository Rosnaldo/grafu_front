import 'package:mobx/mobx.dart';

part 'is_invited_store.g.dart';

abstract class IIsInvitedStore {
  final bool isInvited = false;
  getIsInvited() {}
  setIsInvited(bool i) {}
}

class IsInvitedStore extends IIsInvitedStore {
  final isInvitedMobx = IsInvitedMobx();

  @override
  getIsInvited() {
    return isInvitedMobx.getIsInvited;
  }

  @override
  setIsInvited(bool i) {
    isInvitedMobx.setIsInvited(i);
  }
}

class IsInvitedMobx = IsInvitedMobxBase with _$IsInvitedMobx;

abstract class IsInvitedMobxBase with Store {
  @observable
  bool _isInvited = false;

  @computed
  bool get getIsInvited => _isInvited;

  @action
  setIsInvited(bool i) {
    _isInvited = i;
  }
}
