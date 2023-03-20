import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/speaker/data/models/event_model.dart';
import 'package:ccd2023/utils/build_auth_header.dart';
import 'package:dio/dio.dart';

import '../../speaker.dart';

class EventRepository {
  final DioApiClient _dioApiClient;

  EventRepository(this._dioApiClient);

  Future<List<Event>> getEvents(String authToken) async {
    Response response = await _dioApiClient.getData(
      endPoint: eventsEndpoint,
      headers: buildAuthHeader(
        authToken,
      ),
    );

    List<Event> events = [];
    if (response.statusCode == 200) {
      for (var event in response.data['results']) {
        events.add(Event.fromJson(event));
      }
    } else {
      throw Exception('Failed to load technologies');
    }
    return events;
  }
}
