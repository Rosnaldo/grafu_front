import 'dart:convert';

import 'package:dio/dio.dart';

import "package:grafu/models/playday.dart";
import 'package:grafu/repositories/playday/mapper.dart';
import 'package:grafu/repositories/playday/response_playday.dart';

class PlaydayByIdRepository {
  Future<Playday> get(id) async {
    final response = await Dio().get(
      'https://grafu-back.herokuapp.com/v1/playday/1bb79eaa-457f-4380-acaa-c7af614668cf?participant_user=true',
    );

    final jsonData = json.encode(response.data);
    final responsePlayday = ResponsePlayday.fromJson(jsonData);

    return ResponsePlaydayMapper.toEntity(responsePlayday);
  }
}
