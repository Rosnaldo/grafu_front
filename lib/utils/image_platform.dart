import 'dart:io';

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
    required ValueNotifier<String> imageStore,
  }) {
    if (imageStore.value == '') {
      return Container();
    }

    if (isMobile() && isWeb()) {
      return Image.network(imageStore.value);
    }

    if (isMobile()) {
      return Image.file(File(imageStore.value));
    }

    if (isNotebook()) {
      return Image.network(imageStore.value);
    }

    return Container();
  }
}
