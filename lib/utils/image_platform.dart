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
    required ValueNotifier<String?> imageStore,
  }) {
    if (imageStore.value == null) {
      return Container();
    }

    return Image.network(imageStore.value!);
  }
}
