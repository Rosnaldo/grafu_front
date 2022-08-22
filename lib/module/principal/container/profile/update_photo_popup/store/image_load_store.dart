import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/state/image_load_state.dart';
import 'package:grafu/repositories/user/repository_update_avatar.dart';
import 'package:grafu/services/firestore/index.dart';

abstract class IImageUploadStore extends ValueNotifier<ImageUploadState> {
  IImageUploadStore(super.value);

  Future loadImage(Uint8List bytes, String userId) async {}
}

class ImageUploadStore extends IImageUploadStore {
  ImageUploadStore() : super(InitialImageUploadState());

  @override
  Future loadImage(Uint8List bytes, String userId) async {
    value = LoadingImageUploadState();
    try {
      final repository = UserUpdateAvatarRepository();
      final urlDownload = await FirestoreService().uploadImage(bytes);
      await repository.put(userId, urlDownload);
      value = SuccessImageUploadState();
    } catch (e) {
      value = ErrorImageUploadState(e.toString());
    }
  }
}
