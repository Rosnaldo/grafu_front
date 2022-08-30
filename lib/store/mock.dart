import 'package:grafu/mocks/user.dart';
import 'package:grafu/models/user.dart';
import 'package:grafu/store/user_store.dart';

class MockUserStore extends IUserStore {
  MockUserStore() : super();

  @override
  getUser() {
    return MakeUser.make();
  }

  @override
  setUser(User u) {}
}