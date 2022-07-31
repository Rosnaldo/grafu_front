import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<String?> pickMedia({
    required List<bool> isGallery,
  }) async {
    final ImageSource source =
        isGallery[1] ? ImageSource.gallery : ImageSource.camera;
    final XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile == null) return null;

    CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [CropAspectRatioPreset.square],
    );

    if (cropped == null) return null;

    return cropped.path;
  }
}
