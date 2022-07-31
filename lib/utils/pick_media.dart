import 'package:flutter/material.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:grafu/utils/cropper/ui_helper.dart'
    if (dart.library.io) 'cropper/mobile_ui_helper.dart'
    if (dart.library.html) 'cropper/web_ui_helper.dart';

class PickMedia {
  static Future<String?> execute({
    required List<bool> isGallery,
    required BuildContext context,
  }) async {
    final ImageSource source =
        isGallery[1] ? ImageSource.gallery : ImageSource.camera;
    final XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile == null) return null;
    CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        aspectRatioPresets: [CropAspectRatioPreset.square],
        // ignore: use_build_context_synchronously
        uiSettings: buildUiSettings(context));

    if (cropped == null) return null;
    final file = cropped.path;

    return file;
  }
}
