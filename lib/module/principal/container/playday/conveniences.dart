import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grafu/models/convenience.dart';

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
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
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
                        Flexible(child: Text('• $item')),
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
    return MasonryGridView.count(
      shrinkWrap: true,
      itemCount: conveniences.length,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return buildConvenience(conveniences[index]);
      },
    );
  }
}
