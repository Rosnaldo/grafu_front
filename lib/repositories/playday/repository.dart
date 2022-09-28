import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:grafu/mocks/playday.dart';

import "package:grafu/models/playday.dart";
import 'package:grafu/repositories/playday/mapper.dart';
import 'package:grafu/repositories/playday/response_playday.dart';

abstract class IPlaydayByIdRepository {
  Future<Playday> get(playdayId) async {
    return MakePlayday.make();
  }
}

class PlaydayByIdRepository implements IPlaydayByIdRepository {
  @override
  Future<Playday> get(playdayId) async {
    final response = await Dio().get(
      'https://grafu-back.herokuapp.com/v1/playday/$playdayId?participant_user=true',
    );

    final jsonData = json.encode(response.data);
    final responsePlayday = ResponsePlayday.fromJson(jsonData);

    return ResponsePlaydayMapper.toEntity(responsePlayday);
  }
}
