import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_cropper_for_web/image_cropper_for_web.dart';

List<PlatformUiSettings>? buildUiSettings(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  return [
    WebUiSettings(
      context: context,
      presentStyle: CropperPresentStyle.page,
      boundary: Boundary(
        width: (screenWidth * 0.9).round(),
        height: (screenHeight * 0.8).round(),
      ),
      viewPort: ViewPort(width: 250, height: 250, type: 'circle'),
      enableExif: true,
      enableZoom: true,
      showZoomer: true,
    ),
  ];
}
