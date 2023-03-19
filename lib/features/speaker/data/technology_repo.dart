import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:dio/dio.dart';

import '../speaker.dart';

class TechnologyRepository {
  final DioApiClient _dioApiClient;

  TechnologyRepository(this._dioApiClient);

  Future<List<Technology>> getTechnologies() async {
    Response response =
        await _dioApiClient.getData(endPoint: technologiesEndpoint);

    List<Technology> technologies = [];
    if (response.statusCode == 200) {
      for (var technology in response.data['results']) {
        technologies.add(Technology.fromJson(technology));
      }
    } else {
      throw Exception('Failed to load technologies');
    }
    return technologies;
  }
}
