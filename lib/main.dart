import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:grafu/app_module.dart';
import 'package:grafu/app_widget.dart';

main() {
  Modular.to.addListener(() {
    debugPrint(Modular.to.path);
  });

  setUrlStrategy(PathUrlStrategy());

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
