import 'package:dio/dio.dart';

class ParticipantRegisterRepository {
  Future post(email, playdayId) async {
    await Dio().post(
      'https://grafu-back.herokuapp.com/v1/participant/register',
      data: {
        'email': email,
        'playdayId': playdayId,
      },
    );
  }
}
