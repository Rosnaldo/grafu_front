import 'package:mobx/mobx.dart';

part 'initial_email_store.g.dart';

class InitialEmailStore = InitialEmailStoreBase with _$InitialEmailStore;

abstract class InitialEmailStoreBase with Store {
  @observable
  String email = '';

  @action
  setEmail(String e) {
    email = e;
  }
}
