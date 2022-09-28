import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:grafu/models/avatar.dart';
import 'package:grafu/utils/failure.dart';
import 'package:uuid/uuid.dart';

abstract class IFirestoreService {
  Future uploadImage(Uint8List uint8List) async {}
  Future removeImage(String imageUuid) async {}
}

class FirestoreService implements IFirestoreService {
  FirestoreService() : super();

  @override
  Future uploadImage(Uint8List uint8List) async {
    final storage = FirebaseStorage.instanceFor(
      bucket: 'gs://grafu-357616.appspot.com',
    );
    final uuid = const Uuid().v4();
    final ref = storage.ref('avatar-images').child(uuid);

    final uploadTask = ref.putData(uint8List);
    final snapshot = await uploadTask.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    return Avatar(url: urlDownload, uuid: uuid);
  }

  @override
  Future removeImage(String? imageUuid) async {
    try {
      final storage = FirebaseStorage.instanceFor(
        bucket: 'gs://grafu-357616.appspot.com',
      );

      if (imageUuid == null) {
        return;
      }

      final ref = storage.ref('avatar-images').child('imageUuid');

      await ref.delete();
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') {
        return;
      }
      throw Failure(e.toString());
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}
