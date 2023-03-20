import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/data/repository/dio/dio_api_client.dart';
import 'package:ccd2023/features/auth/auth.dart';
import 'package:dio/dio.dart';

import '../../../../utils/build_auth_header.dart';

class AuthenticationRepository {
  final DioApiClient _dioApiClient;

  AuthenticationRepository(this._dioApiClient);

  Future<LoginResponse> signIn({
    required String username,
    required String email,
    required String password,
  }) async {
    Response response = await _dioApiClient.postData(
      endPoint: loginEndpoint,
      dataPayload: {
        'username': username,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(response.data);

      return loginResponse;
    } else {
      if (response.statusCode == 400) {
        final errorResponse = response.data['non_field_errors'][0];

        throw Exception(errorResponse);
      }
      throw Exception('Failed to login. Please try again.');
    }
  }

  Future signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    Response response = await _dioApiClient.postData(
      endPoint: registrationEndpoint,
      dataPayload: {
        'username': username,
        'email': email,
        'password1': password,
        'password2': password,
      },
    );

    final signUpResponse = response.data;

    return signUpResponse;
  }

  Future resetPassword({
    required String email,
  }) async {
    Response response = await _dioApiClient.postData(
      endPoint: passwordResetEndpoint,
      dataPayload: {
        'email': email,
      },
    );

    if (response.statusCode == 200) {
      final resetResponse = response.data;

      return resetResponse;
    } else if (response.statusCode == 400) {
      final resetResponse = response.data;

      throw Exception(resetResponse);
    }
  }

  Future<Profile> updateProfile({
    required Profile profile,
    required String authToken,
  }) async {
    Response response = await _dioApiClient.postData(
      endPoint: usersUpdateEndpoint,
      dataPayload: profile.toJson(),
      headers: buildAuthHeader(
        authToken,
      ),
    );

    if (response.statusCode == 200) {
      final updateResponse = response.data;

      print(updateResponse);
      return Profile.fromJson(updateResponse);
    } else {
      throw Exception('Error updating profile. Please try again.');
    }
  }
}
