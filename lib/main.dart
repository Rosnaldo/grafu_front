import 'package:flutter/material.dart';

import 'package:grafu/pages/profile/index.dart';
import 'package:grafu/pages/playday/index.dart';
import 'package:grafu/router_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final screens = [
    const ProfilePage(),
    PlaydayPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
