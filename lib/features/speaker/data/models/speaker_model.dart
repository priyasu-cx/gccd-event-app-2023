import 'package:freezed_annotation/freezed_annotation.dart';
part 'speaker_model.freezed.dart';
part 'speaker_model.g.dart';

@freezed
class SpeakerModel with _$SpeakerModel {
  const factory SpeakerModel({
    required String? title,
    required String? description,
    required String? type,
    required List<Speaker?>? speakers,
  }) = _SpeakerModel;

  factory SpeakerModel.fromJson(Map<String, dynamic> json) =>
      _$SpeakerModelFromJson(json);
}

@freezed
class Speaker with _$Speaker {
  const factory Speaker({
    required String? fullName,
    required String? bio,
    required String? profilePicture,
    required List<SpeakerSocialLinks?>? links,
    required String? tagLine,
  }) = _Speaker;

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);
}

@freezed
class SpeakerSocialLinks with _$SpeakerSocialLinks {
  const factory SpeakerSocialLinks({
    required String? title,
    required String? url,
  }) = _SpeakerSocialLinks;

  factory SpeakerSocialLinks.fromJson(Map<String, dynamic> json) =>
      _$SpeakerSocialLinksFromJson(json);
}
