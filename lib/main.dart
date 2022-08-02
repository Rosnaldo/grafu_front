import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:grafu/app_module.dart';
import 'package:grafu/app_widget.dart';

bool shouldUseFirebaseEmulator = false;
main() async {
  Modular.to.addListener(() {
    debugPrint(Modular.to.path);
  });

  setUrlStrategy(PathUrlStrategy());

  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAFBhvR7EY-W4xx6piqtgERQvIYr84pfVk',
        authDomain: 'grafu-357616.firebaseapp.com',
        projectId: 'grafu-357616',
        storageBucket: 'grafu-357616.appspot.com',
        messagingSenderId: '756062203722',
        appId: '1:756062203722:web:24b5e215c3042a2f321bb3',
        measurementId: 'G-Y8BSTPEJ1Q',
      ),
    );
  }

  if (shouldUseFirebaseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
