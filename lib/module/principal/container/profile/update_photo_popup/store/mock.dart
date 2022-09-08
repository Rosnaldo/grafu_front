import 'dart:typed_data';

import 'package:grafu/module/principal/container/profile/update_photo_popup/state/avatar_load_state.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/store/avatar_load_store.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';
import 'package:grafu/store/user_store/user_store.dart';

class MockImageUploadStore extends IImageUploadStore {
  MockImageUploadStore() : super(InitialAvatarUploadState());

  @override
  Future loadImage(Uint8List bytes, UserStore userStore, MyParticipantStore myParticipantStore) async {}
}
