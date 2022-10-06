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
                : 'https://firebasestorage.googleapis.com/v0/b/grafu-357616.appspot.com/o/avatar-svg%2Favatar.png?alt=media&token=20c54640-1f37-4a5a-b685-85417a0a3667',
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
