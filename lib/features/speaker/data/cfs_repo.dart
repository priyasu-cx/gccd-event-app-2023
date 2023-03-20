import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/utils/build_auth_header.dart';
import 'package:dio/dio.dart';

import '../speaker.dart';

class CFSRepository {
  final DioApiClient _dioApiClient;

  CFSRepository(this._dioApiClient);

  Future submitSpeakerProfile(
    SpeakerPayload payload,
    String authToken,
  ) async {
    Response response = await _dioApiClient.postData(
      endPoint: speakerEndpoint,
      dataPayload: payload.toJson(),
      headers: buildAuthHeader(
        authToken,
      ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to submit your profile');
    }
    return response.data;
  }

  Future<List<dynamic>> getSpeakerList(
    String authToken,
  ) async {
    Response response = await _dioApiClient.getData(
      endPoint: speakerEndpoint,
      headers: buildAuthHeader(
        authToken,
      ),
    );
    print(response.data);
    return response.data;
  }
}
