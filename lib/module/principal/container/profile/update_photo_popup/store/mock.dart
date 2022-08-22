import 'dart:typed_data';

import 'package:grafu/module/principal/container/profile/update_photo_popup/state/image_load_state.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/store/image_load_store.dart';

class MockImageUploadStore extends IImageUploadStore {
  MockImageUploadStore() : super(InitialImageUploadState());

  @override
  Future loadImage(Uint8List bytes, String userId) async {}
}
