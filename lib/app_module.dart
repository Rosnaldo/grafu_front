import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:grafu/module/login/business/index.dart';
import 'package:grafu/module/principal/principal_module.dart';
import 'package:grafu/module/register/index.dart';
import 'package:grafu/module/reset/index.dart';
import 'package:grafu/module/reset_email_message/index.dart';
import 'package:grafu/module/verify_email_message/index.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
        ChildRoute('/register', child: (context, args) => const RegisterPage()),
        ChildRoute('/reset', child: (context, args) => const ResetPage()),
        ChildRoute('/reset-email-message',
            child: (context, args) => const ResetEmailMessagePage()),
        ChildRoute('/verify-email-message',
            child: (context, args) => const VerifyEmailMessagePage()),
        ModuleRoute('/principal', module: PrincipalModule()),
        WildcardRoute(
            child: (_, __) => const Scaffold(
                    body: Center(
                  child: Text('Pagina não existe'),
                )))
      ];
}
