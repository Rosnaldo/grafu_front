import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  @observable
  String? email;

  @computed
  bool get isLogged => email != null;

  @action
  setEmail(String e) {
    email = e;
  }
}
