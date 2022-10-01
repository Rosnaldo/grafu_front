import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grafu/models/convenience.dart';
import 'package:grafu/module/principal/container/playday/section_title.dart';
import 'package:grafu/styles/color.dart';
import 'package:grafu/styles/text_style.dart';

class Conveniences extends StatelessWidget {
  final List<Convenience> conveniences;

  const Conveniences({
    Key? key,
    required this.conveniences,
  }) : super(key: key);

  Widget buildConvenience(Convenience convenience) {
    return Column(
      children: [
        Row(
          children: [
            convenience.icon,
            const SizedBox(
              width: 6.0,
            ),
            Text(
              convenience.title,
              style: textStrongStyle,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: convenience.items
                  .map(
                    (item) => Row(
                      children: [
                        Flexible(
                            child: Text(
                          '• $item',
                          style: const TextStyle(color: mainText),
                        )),
                      ],
                    ),
                  )
                  .toList()),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: 'Conveniências'),
        const SizedBox(height: 12.0),
        MasonryGridView.count(
          shrinkWrap: true,
          itemCount: conveniences.length,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return buildConvenience(conveniences[index]);
          },
        ),
      ],
    );
  }
}
