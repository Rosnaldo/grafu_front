library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:grafu/repositories/participant/response_participant.dart';
import 'package:grafu/repositories/playday/response_playday.dart';
import 'package:grafu/repositories/user/response_user.dart';

part 'serializers.g.dart';

@SerializersFor([ResponsePlayday, ResponseParticipant, ResponseUser])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
