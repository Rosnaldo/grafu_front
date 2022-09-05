import 'package:dio/dio.dart';

class ParticipantCheckInviteStatusRepository {
  Future get(email, playdayId) async {
    return Dio().get(
        'https://grafu-back.herokuapp.com/v1/participant/check-invite-status/$playdayId/$email');
  }
}
