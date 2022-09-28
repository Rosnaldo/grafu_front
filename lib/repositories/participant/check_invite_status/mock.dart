import 'package:grafu/repositories/participant/check_invite_status/index.dart';

class MockParticipantCheckInviteStatusRepository
    implements IParticipantCheckInviteStatusRepository {
  @override
  Future<String> get(email, playdayId) async {
    return '';
  }
}
