import 'package:flutter/material.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/state/image_load_state.dart';
import 'package:grafu/module/principal/container/profile/update_photo_popup/store/image_load_store.dart';

import 'package:grafu/utils/cropper/mobile_ui_helper.dart';
import 'package:grafu/utils/image_platform.dart';
import 'package:grafu/utils/pick_media.dart';

class UpdatePhotoPopupContainer extends StatefulWidget {
  final IImageUploadStore store;

  const UpdatePhotoPopupContainer({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<UpdatePhotoPopupContainer> createState() =>
      UpdatePhotoPopupContainerState();
}

class UpdatePhotoPopupContainerState extends State<UpdatePhotoPopupContainer> {
  Widget buildImage<GlobalState>(_, ImageLoadState state, __) {
    if (state is LoadingImageLoadState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ErrorImageLoadState) {
      return Center(
        child: Text(state.message),
      );
    }

    if (state is SuccessImageLoadState) {
      return Container(
        child: ImagePlatform.image(image: state.image),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: AnimatedBuilder(
            animation: widget.store,
            builder: (context, child) {
              return ClipOval(
                child: ValueListenableBuilder<ImageLoadState>(
                  valueListenable: widget.store,
                  builder: buildImage,
                ),
              );
            }),
      ),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final bytes = await PickMedia.execute(
                    uiSettings: buildUiSettings(context),
                  );

                  widget.store.loadImage(bytes!);
                },
                child: const Text('Carregar foto'),
              ),
              const SizedBox(width: 10.0),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
