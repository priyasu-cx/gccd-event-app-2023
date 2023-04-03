import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.g.dart';
part 'profile_model.freezed.dart';

//ignore_for_file:invalid_annotation_target
@freezed
class Profile with _$Profile {
  const factory Profile({
    @JsonKey(name: 'pronoun') required String? pronoun,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required Map<String,dynamic> settings,
    @JsonKey(name: 'country_code') required String countryCode,
    String? phone,
    String? college,
    String? course,
    @JsonKey(name: 'graduation_year') required int graduationYear,
    String? company,
    String? role,
    required Map<String,dynamic> socials,
    @JsonKey(name: 'food_choice') required String foodChoice,
    @JsonKey(name: 'tsize') required String tSize,
    @JsonKey(name: 'referral_count') required int referral,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}
