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
    try {
      Response response = await _dioApiClient.postData(
        endPoint: speakerEndpoint,
        dataPayload: payload.toJson(),
        headers: buildAuthHeader(
          authToken,
        ),
      );
      return response.data;
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
