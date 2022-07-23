import 'package:flutter/material.dart';
import 'package:grafu/mocks/playday.dart';

class GalleryPage extends StatelessWidget {
  final List<String> images = MakePlayday.make().gallery;

  GalleryPage({
    Key? key,
  }) : super(key: key);

  Widget buildImage(String image) {
    return Column(children: [
      Image.network(
        image,
        fit: BoxFit.fitWidth,
      ),
      const SizedBox(
        height: 2.0,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: images.map((image) => buildImage(image)).toList()),
        ),
      ),
    );
  }
}
