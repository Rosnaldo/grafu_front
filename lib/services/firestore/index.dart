import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

abstract class IFirestoreService {
  IFirestoreService();

  Future uploadImage(Uint8List uint8List) async {}
}

class FirestoreService extends IFirestoreService {
  late Reference ref;

  construct() {
    final storage = FirebaseStorage.instanceFor(
      bucket: 'gs://grafu-357616.appspot.com',
    );

    ref = storage.ref('avatar-images');
  }

  @override
  Future<String> uploadImage(Uint8List uint8List) async {
    final uploadTask = ref.child(const Uuid().v4()).putData(uint8List);

    final snapshot = await uploadTask.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    return urlDownload;
  }
}
