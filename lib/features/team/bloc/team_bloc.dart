import 'dart:convert';
import 'package:ccd2023/features/team/model/team_model.dart';
import 'package:http/http.dart' as http;

class TeamBloc {
  final String apiUrl = 'https://raw.githubusercontent.com/gdgcloudkol/ccd2023/prod/src/assets/content/team/content.json';

  Future<List<Team>> getTeam(int n) async {
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Team.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load team data');
    }
  }
}