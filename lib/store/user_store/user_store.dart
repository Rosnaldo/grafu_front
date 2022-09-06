import 'package:mobx/mobx.dart';

import 'package:grafu/mocks/user.dart';
import 'package:grafu/models/user.dart';

part 'user_store.g.dart';

abstract class IUserStore {
  final User user = MakeUser.make();
  User getUser() {
    return user;
  }

  setUser(User u) {}
}

class UserStore extends IUserStore {
  final userMobx = UserMobx();

  @override
  User getUser() {
    return userMobx.getUser;
  }

  @override
  setUser(User u) {
    userMobx.setUser(u);
  }
}

class UserMobx = UserMobxBase with _$UserMobx;

abstract class UserMobxBase with Store {
  @observable
  User _user = MakeUser.make();

  @computed
  User get getUser => _user;

  @action
  setUser(User u) {
    _user = u;
  }
}
