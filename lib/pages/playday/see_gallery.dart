import 'package:flutter/material.dart';

class SeeGallery extends StatelessWidget {
  const SeeGallery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            icon: const Icon(Icons.collections, size: 15.0),
            onPressed: () => {Navigator.of(context).pushNamed('/gallery')},
            label: const Text(
              'Ver fotos',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.pink.shade200),
            ),
          ),
        ],
      ),
    );
  }
}
