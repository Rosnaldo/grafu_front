import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:grafu/module/login/index.dart';
import 'package:grafu/module/principal/principal_module.dart';
import 'package:grafu/module/register/index.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginPage()),
        ChildRoute('/register', child: (context, args) => RegisterPage()),
        ModuleRoute('/principal', module: PrincipalModule()),
        WildcardRoute(
            child: (_, __) => const Scaffold(
                    body: Center(
                  child: Text('Pagina não existe'),
                )))
      ];
}
