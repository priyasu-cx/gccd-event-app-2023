import 'dart:convert';
import 'package:ccd2023/configurations/constants.dart';
import 'package:ccd2023/features/app/data/repository/dio/dio_api_client.dart';
import 'package:ccd2023/features/speaker/data/models/speaker_model.dart';

class SpeakerRepository {
  final DioApiClient _dioApiClient;

  SpeakerRepository(this._dioApiClient);

  Future<SpeakerModel> getSpeaker() async {
    final response = await _dioApiClient.getJsonData(endPoint: speakerDataURI);

    SpeakerModel speaker;

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.data);
      speaker = SpeakerModel.fromJson(responseMap);
    } else {
      throw Exception('Failed to load speakers');
    }
    return speaker;
  }
}
