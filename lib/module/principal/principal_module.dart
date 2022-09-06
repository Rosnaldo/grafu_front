import 'package:flutter_modular/flutter_modular.dart';
import 'package:grafu/module/principal/business/gallery/index.dart';
import 'package:grafu/module/principal/business/playday/index.dart';
import 'package:grafu/module/principal/business/profile/index.dart';
import 'package:grafu/module/principal/business/index.dart';
import 'package:grafu/repositories/participant/check_invite_status/index.dart';
import 'package:grafu/repositories/participant/register/index.dart';
import 'package:grafu/repositories/playday/repository.dart';
import 'package:grafu/repositories/user/repository.dart';
import 'package:grafu/store/global_store/store.dart';
import 'package:grafu/store/is_invited_store/is_invited_store.dart';
import 'package:grafu/store/participant_store/my_participant_store.dart';
import 'package:grafu/store/user_store/user_store.dart';

class PrincipalModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ParticipantCheckInviteStatusRepository()),
        Bind.lazySingleton((i) => ParticipantRegisterRepository()),
        Bind.lazySingleton((i) => UserByEmailRepository()),
        Bind.lazySingleton((i) => PlaydayByIdRepository()),
        Bind.lazySingleton((i) => UserStore()),
        Bind.lazySingleton((i) => MyParticipantStore()),
        Bind.lazySingleton((i) => IsInvitedStore()),
        Bind.lazySingleton((i) => PlaydayByIdRepository()),
        Bind.lazySingleton(
            (i) => GlobalStore(i(), i(), i(), i(), i(), i(), i(), i())),
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
