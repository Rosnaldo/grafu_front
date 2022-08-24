import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final secureStorage = Modular.get<FlutterSecureStorage>();

    final token = await secureStorage.read(key: 'token');
    if (token == null) {
      return false;
    }

    final dio = Dio();
    final result = await dio.post(
      'https://us-central1-grafu-357616.cloudfunctions.net/token/verify-token',
      data: {
        'authorization': 'Bearer $token',
      },
    );

    final isAuthorized = result.data['authorized'];
    if (!isAuthorized) {
      return false;
    }

    return true;
  }
}
