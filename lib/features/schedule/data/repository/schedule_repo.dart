

import 'dart:convert';

import 'package:ccd2023/features/app/data/repository/dio/dio_api_client.dart';
import 'package:ccd2023/features/schedule/data/models/schedule_model.dart';

class ScheduleRepository {
  final DioApiClient _dioApiClient;

  ScheduleRepository(this._dioApiClient);

  Future<List<Schedule>> getSchedule() async {
    final response = await _dioApiClient.getJsonData(endPoint: "https://raw.githubusercontent.com/gdgcloudkol/ccd2023/prod/src/assets/content/schedule/content.json");

    List<Schedule>? schedule = [];

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.data);
      schedule = (responseMap as List).map((e) => Schedule.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load partners');
    }
    return schedule;
  }
}