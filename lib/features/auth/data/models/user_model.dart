import 'package:ccd2023/features/auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

//ignore_for_file:invalid_annotation_target
@freezed
class User with _$User {
  const factory User({
    required int pk,
    required String email,
    required String username,
    @JsonKey(name: 'first_name') required String firstName,
    required Profile profile,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
