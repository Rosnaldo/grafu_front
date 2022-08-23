import 'package:mobx/mobx.dart';

import 'package:grafu/mocks/user.dart';
import 'package:grafu/models/user.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  @observable
  User user = MakeUser.make();

  @action
  setUser(User u) {
    user = u;
  }
}
