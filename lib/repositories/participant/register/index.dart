import 'package:dio/dio.dart';

abstract class IParticipantRegisterRepository {
  Future post(email, playdayId) async {}
}

class ParticipantRegisterRepository implements IParticipantRegisterRepository {
  @override
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
