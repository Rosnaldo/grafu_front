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
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
  }
}
