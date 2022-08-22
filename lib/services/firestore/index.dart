import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

abstract class IFirestoreService {
  Future<String> uploadImage(Uint8List uint8List) async {
    return '';
  }
}

class FirestoreService extends IFirestoreService {
  @override
  Future<String> uploadImage(Uint8List uint8List) async {
    final storage = FirebaseStorage.instanceFor(
      bucket: 'gs://grafu-357616.appspot.com',
    );

    final ref = storage.ref('avatar-images');

    final uploadTask = ref.child(const Uuid().v4()).putData(uint8List);

    final snapshot = await uploadTask.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    return urlDownload;
  }
}
