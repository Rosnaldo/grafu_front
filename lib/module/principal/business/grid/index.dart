import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/container/grid/index.dart';
import 'package:grafu/store/global_store.dart';

class GridPage extends StatelessWidget {
  const GridPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<GlobalStore>();

    return GridPageContainer(
      store: store,
    );
  }
}
