import 'package:ccd2023/configurations/configurations.dart';
import 'package:dio/dio.dart';

import '../../../utils/build_auth_header.dart';
import '../../app/data/repository/dio/dio_api_client.dart';

class TicketRepository {
  final DioApiClient _dioApiClient;

  TicketRepository(this._dioApiClient);

  Future<List> getTicketInfo(
    String authToken,
  ) async {
    Response response = await _dioApiClient.getData(
      endPoint: ticketEndpoint,
      headers: buildAuthHeader(
        authToken,
      ),
    );
    return response.data;
  }
}
