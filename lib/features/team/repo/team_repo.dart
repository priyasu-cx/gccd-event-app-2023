import 'dart:convert';

import 'package:ccd2023/configurations/constants.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/team/model/team_model.dart';

class TeamRepository {
  final DioApiClient _dioApiClient;

  TeamRepository(this._dioApiClient);

  Future<List<Team>> getTeam() async {
    final response = await _dioApiClient.getJsonData(endPoint: teamDataURI);

    List<Team> team = [];

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.data);
      team = (responseMap as List).map((e) => Team.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load partners');
    }
    return team;
  }
}
