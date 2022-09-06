import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:grafu/models/user.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/state/avatar_load_state.dart';
import 'package:grafu/repositories/user/repository_update_avatar.dart';
import 'package:grafu/services/firestore/index.dart';

abstract class IImageUploadStore extends ValueNotifier<AvatarUploadState> {
  IImageUploadStore(super.value);

  Future loadImage(Uint8List bytes, User user) async {}
}

class ImageUploadStore extends IImageUploadStore {
  ImageUploadStore() : super(InitialAvatarUploadState());

  @override
  Future loadImage(Uint8List bytes, User user) async {
    value = LoadingAvatarUploadState();

    final firestore = FirestoreService();
    try {
      final repository = UserUpdateAvatarRepository();
      final urlDownload = await firestore.uploadImage(bytes);
      await repository.put(user.id, urlDownload);
      // await firestore.removeImage(uploadUrl.uuid);
      value = SuccessAvatarUploadState(urlDownload);
    } catch (e) {
      value = ErrorAvatarUploadState(e.toString());
    }
  }
}
