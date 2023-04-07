import 'package:freezed_annotation/freezed_annotation.dart';

part 'speaker_payload.freezed.dart';

part 'speaker_payload.g.dart';

//ignore_for_file: invalid_annotation_target
@freezed
class SpeakerPayload with _$SpeakerPayload {
  const factory SpeakerPayload({
    @JsonKey(name: 'topics_of_expertise') required List<int> topicsOfExpertise,
    @JsonKey(name: 'previous_talk_links') required String previousTalks,
    @JsonKey(name: 'travel_support_required') required String travelSupport,
    @JsonKey(name: 'has_spoken_previously') required bool previouslyTalked,
    String? user,
  }) = _SpeakerPayload;

  factory SpeakerPayload.fromJson(Map<String, dynamic> json) =>
      _$SpeakerPayloadFromJson(json);
}
