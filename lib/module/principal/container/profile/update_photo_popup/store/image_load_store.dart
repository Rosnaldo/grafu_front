import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/state/image_load_state.dart';
import 'package:grafu/services/firestore/index.dart';

abstract class IImageUploadStore extends ValueNotifier<ImageLoadState> {
  IImageUploadStore(super.value);

  Future loadImage(Uint8List bytes) async {}
}

class ImageUploadStore extends IImageUploadStore {
  ImageUploadStore() : super(InitialImageLoadState(''));

  @override
  Future loadImage(Uint8List bytes) async {
    value = LoadingImageLoadState();
    try {
      final urlDownload = await FirestoreService().uploadImage(bytes);
      value = SuccessImageLoadState(urlDownload);
    } catch (e) {
      value = ErrorImageLoadState(e.toString());
    }
  }
}
