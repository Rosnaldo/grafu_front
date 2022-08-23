import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/state/avatar_load_state.dart';
import 'package:grafu/repositories/user/repository_update_avatar.dart';
import 'package:grafu/services/firestore/index.dart';

abstract class IImageUploadStore extends ValueNotifier<AvatarUploadState> {
  IImageUploadStore(super.value);

  Future loadImage(Uint8List bytes, String userId) async {}
}

class ImageUploadStore extends IImageUploadStore {
  ImageUploadStore() : super(InitialAvatarUploadState());

  @override
  Future loadImage(Uint8List bytes, String userId) async {
    value = LoadingAvatarUploadState();
    try {
      final repository = UserUpdateAvatarRepository();
      final urlDownload = await FirestoreService().uploadImage(bytes);
      await repository.put(userId, urlDownload);
      value = SuccessAvatarUploadState(urlDownload);
    } catch (e) {
      value = ErrorAvatarUploadState(e.toString());
    }
  }
}
