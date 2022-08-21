import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

List<PlatformUiSettings>? buildUiSettings(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return [
    AndroidUiSettings(
      toolbarTitle: 'Cropper',
      toolbarWidgetColor: Colors.black,
      initAspectRatio: CropAspectRatioPreset.original,
      lockAspectRatio: false,
    ),
    IOSUiSettings(
      title: 'Cropper',
    ),
    WebUiSettings(
      context: context,
      presentStyle: CropperPresentStyle.page,
      boundary: CroppieBoundary(
        width: (screenWidth * 0.9).round(),
        height: (screenHeight * 0.8).round(),
      ),
      viewPort: const CroppieViewPort(
        width: 250,
        height: 250,
        type: 'circle',
      ),
      enableExif: true,
      enableZoom: true,
      showZoomer: true,
    ),
  ];
}
