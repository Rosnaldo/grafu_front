import 'dart:typed_data';

import 'package:grafu/services/firestore/index.dart';

class MockFirestoreService extends IFirestoreService {
  @override
  Future uploadImage(Uint8List uint8List) async {}

  @override
  Future removeImage(String imageUuid) async {}
}
