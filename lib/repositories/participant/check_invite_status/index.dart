import 'dart:convert';

import 'package:dio/dio.dart';

class ParticipantCheckInviteStatusRepository {
  Future<String> get(email, playdayId) async {
    final response = await Dio().get(
        'https://grafu-back.herokuapp.com/v1/participant/check-invite-status/$playdayId/$email');

    final jsonData = json.encode(response.data);
    return json.decode(jsonData);
  }
}
