import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildImageCache {
  static ImageProvider<Object> build({
    String? url,
    int? maxWidth,
    int? maxHeight,
  }) {
    return CachedNetworkImageProvider(
      url ??
          'https://firebasestorage.googleapis.com/v0/b/grafu-357616.appspot.com/o/avatar-svg%2Favatar.png?alt=media&token=20c54640-1f37-4a5a-b685-85417a0a3667',
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
  }
}
