import 'package:flutter/material.dart';

import 'package:grafu/pages/gallery/index.dart';
import 'package:grafu/pages/register/index.dart';
import 'package:grafu/pages/login/index.dart';
import 'package:grafu/components/navigate/index.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case '/principal':
        return MaterialPageRoute(builder: (_) => const Navigate());
      case '/gallery':
        return MaterialPageRoute(builder: (_) => GalleryPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
          body: Center(
        child: Text('ERROR'),
      ));
    });
  }
}
