import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/speaker/data/payloads/submitted_talk_payload.dart';
import 'package:ccd2023/features/speaker/data/payloads/talk_payload.dart';
import 'package:ccd2023/utils/build_auth_header.dart';
import 'package:dio/dio.dart';

import '../../speaker.dart';

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

  Future submitTalk(
    TalkPayload payload,
    String authToken,
  ) async {
    Response response = await _dioApiClient.postData(
      endPoint: talksEndpoint,
      dataPayload: payload.toJson(),
      headers: buildAuthHeader(
        authToken,
      ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to submit your talk');
    }
    return response.data;
  }

  Future updateTalk(
    TalkPayload payload,
    String authToken,
  ) async {
    Response response = await _dioApiClient.putData(
      endPoint: '$talksEndpoint${payload.id}/',
      dataPayload: payload.toJson(),
      headers: buildAuthHeader(
        authToken,
      ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update your talk');
    }
    return response.data;
  }

  Future deleteTalk(
    String authToken,
    int id,
  ) async {
    Response response = await _dioApiClient.deleteData(
      endPoint: '$talksEndpoint$id/',
      headers: buildAuthHeader(
        authToken,
      ),
    );
    if (response.statusCode != 204) {
      throw Exception('Failed to delete your talk');
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
    return response.data;
  }

  Future<List<SubmittedTalkPayload>> getTalksList(
    String authToken,
  ) async {
    Response response = await _dioApiClient.getData(
      endPoint: talksEndpoint,
      headers: buildAuthHeader(
        authToken,
      ),
    );

    final talks = <SubmittedTalkPayload>[];

    for (var talkData in response.data) {
      talks.add(SubmittedTalkPayload.fromJson(talkData));
    }
    return talks;
  }
}
