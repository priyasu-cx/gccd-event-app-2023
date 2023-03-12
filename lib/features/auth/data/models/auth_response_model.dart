import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ccd2023/features/auth/auth.dart';

part 'auth_response_model.g.dart';
part 'auth_response_model.freezed.dart';

//ignore_for_file:invalid_annotation_target
@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    required User user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
