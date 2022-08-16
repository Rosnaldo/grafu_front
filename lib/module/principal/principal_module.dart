import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/business/gallery/index.dart';
import 'package:grafu/module/principal/business/playday/index.dart';
import 'package:grafu/module/principal/business/profile/index.dart';
import 'package:grafu/module/principal/business/index.dart';
import 'package:grafu/repositories/playday/repository.dart';
import 'package:grafu/repositories/user/repository.dart';
import 'package:grafu/store/global_store.dart';

class PrincipalModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => UserByEmailRepository()),
        Bind.factory((i) => PlaydayByIdRepository()),
        Bind.singleton((i) => GlobalStore(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const PrincipalPage(), children: [
          ChildRoute('/profile', child: (context, args) => const ProfilePage()),
          ChildRoute('/playday', child: (context, args) => const PlaydayPage()),
          ChildRoute('/gallery', child: (context, args) => const GalleryPage()),
        ]),
      ];
}
