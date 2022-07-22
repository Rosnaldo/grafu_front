import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/gallery/index.dart';
import 'package:grafu/module/principal/index.dart';
import 'package:grafu/module/principal/playday/index.dart';
import 'package:grafu/module/principal/profile/index.dart';

class PrincipalModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const PrincipalPage(), children: [
          ChildRoute('/profile', child: (context, args) => const ProfilePage()),
          ChildRoute('/playday', child: (context, args) => PlaydayPage()),
          ChildRoute('/gallery', child: (context, args) => GalleryPage()),
        ]),
      ];
}
