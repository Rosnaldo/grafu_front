import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/state/avatar_load_state.dart';
import 'package:grafu/repositories/user/repository_update_avatar.dart';
import 'package:grafu/services/firestore/index.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';
import 'package:grafu/store/user_store/user_store.dart';

abstract class IImageUploadStore extends ValueNotifier<AvatarUploadState> {
  IImageUploadStore(super.value);

  Future loadImage(Uint8List bytes, IUserStore userStore,
      IMyParticipantStore myParticipantStore) async {}
}

class ImageUploadStore extends IImageUploadStore {
  ImageUploadStore() : super(InitialAvatarUploadState());

  @override
  Future loadImage(
    Uint8List bytes,
    IUserStore userStore,
    IMyParticipantStore myParticipantStore,
  ) async {
    value = LoadingAvatarUploadState();

    final firestore = FirestoreService();
    try {
      final repository = UserUpdateAvatarRepository();
      final newAvatar = await firestore.uploadImage(bytes);
      await repository.put(userStore.getUser().id, newAvatar);

      await firestore.removeImage(userStore.getUser().avatar?.uuid);

      userStore.setUser(
        userStore.getUser().copyWith(avatar: newAvatar),
      );

      myParticipantStore.setMyParticipant(
        myParticipantStore.getMyParticipant().copyWith(avatar: newAvatar),
      );
      value = SuccessAvatarUploadState();
    } catch (e) {
      value = ErrorAvatarUploadState(e.toString());
    }
  }
}
