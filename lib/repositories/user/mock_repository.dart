import 'package:grafu/mocks/user.dart';
import 'package:grafu/models/user.dart';
import 'package:grafu/repositories/user/repository.dart';

class MockUserByEmailRepository implements IUserByEmailRepository {
  @override
  Future<User> get(email) async {
    return MakeUser.make();
  }
}
