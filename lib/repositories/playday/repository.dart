import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:grafu/mocks/playday.dart';

import "package:grafu/models/playday.dart";
import 'package:grafu/repositories/playday/mapper.dart';
import 'package:grafu/repositories/playday/response_playday.dart';

class PlaydayByIdRepository {
  Future<Playday> get(playdayId) async {
    try {
      final response = await Dio().get(
        'https://grafu-back.herokuapp.com/v1/playday/$playdayId?participant_user=true',
      );

      final jsonData = json.encode(response.data);
      final responsePlayday = ResponsePlayday.fromJson(jsonData);

      return ResponsePlaydayMapper.toEntity(responsePlayday);
    } catch (err) {
      print(err);
      return MakePlayday.make();
    }
  }
}
