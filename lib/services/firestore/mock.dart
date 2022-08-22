import 'dart:typed_data';

import 'package:grafu/services/firestore/index.dart';

class MockFirestoreService extends IFirestoreService {
  @override
  Future<String> uploadImage(Uint8List uint8List) async {
    return '';
  }
}
