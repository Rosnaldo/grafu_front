import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// import 'package:grafu/guards/auth_guard.dart';
import 'package:grafu/module/login/business/index.dart';
import 'package:grafu/module/principal/principal_module.dart';
import 'package:grafu/module/register/business/index.dart';
import 'package:grafu/module/reset/index.dart';
import 'package:grafu/module/reset_email_message/index.dart';
import 'package:grafu/module/verify_email_message/index.dart';
import 'package:grafu/services/google_signin/index.dart';
import 'package:grafu/services/sign_in/index.dart';
import 'package:grafu/services/signout/index.dart';
import 'package:grafu/store/login_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => LoginStore()),
        Bind.lazySingleton((i) => SignIn(i())),
        Bind.lazySingleton((i) => SignOut(i())),
        Bind.lazySingleton((i) => SignInWithGoogle()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
        ChildRoute('/register', child: (context, args) => const RegisterPage()),
        ChildRoute('/reset', child: (context, args) => const ResetPage()),
        ChildRoute('/reset-email-message',
            child: (context, args) => const ResetEmailMessagePage()),
        ChildRoute('/verify-email-message',
            child: (context, args) => const VerifyEmailMessagePage()),
        ModuleRoute(
          '/principal',
          module: PrincipalModule(),
          // guards: [AuthGuard()],
        ),
        WildcardRoute(
          child: (_, __) => const Scaffold(
              body: Center(
            child: Text('Pagina não existe'),
          )),
        ),
      ];
}
