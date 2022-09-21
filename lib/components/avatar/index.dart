import 'package:flutter/material.dart';
import 'package:grafu/components/image_cache/index.dart';
import 'package:grafu/models/avatar.dart';

class AvatarWidget extends StatefulWidget {
  final Avatar? avatar;
  final Function()? onTap;
  final int size;
  const AvatarWidget({
    Key? key,
    this.avatar,
    this.onTap,
    required this.size,
  }) : super(key: key);

  @override
  State<AvatarWidget> createState() => AvatarWidgetState();
}

class AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: BuildImageCache.build(
            url: (widget.avatar != null)
                ? widget.avatar!.url
                : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
            maxWidth: widget.size,
            maxHeight: widget.size,
          ),
          fit: BoxFit.cover,
          width: widget.size.toDouble(),
          height: widget.size.toDouble(),
          child: InkWell(
            onTap: widget.onTap,
          ),
        ),
      ),
    );
  }
}
