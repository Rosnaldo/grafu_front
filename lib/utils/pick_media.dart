import 'dart:typed_data';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PickMedia {
  static Future<Uint8List?> execute({
    required uiSettings,
  }) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return null;
    CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [CropAspectRatioPreset.square],
      uiSettings: uiSettings,
    );

    if (cropped == null) return null;

    final bytes = await cropped.readAsBytes();

    return bytes;
  }
}
