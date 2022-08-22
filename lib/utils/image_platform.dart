import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImagePlatform {
  static bool isMobile() {
    return defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android;
  }

  static bool isNotebook() {
    return defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows;
  }

  static bool isWeb() {
    return kIsWeb;
  }

  static Widget image({
    required String? image,
  }) {
    if (image == null) {
      return Container();
    }

    return ClipOval(
      child: Material(
        child: Ink.image(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          width: 128,
          height: 128,
        ),
      ),
    );
  }
}
