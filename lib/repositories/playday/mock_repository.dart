import 'package:grafu/mocks/playday.dart';
import 'package:grafu/models/playday.dart';
import 'package:grafu/repositories/playday/repository.dart';

class MockPlaydayByIdRepository implements IPlaydayByIdRepository {
  @override
  Future<Playday> get(playdayId) async {
    return MakePlayday.make();
  }
}
