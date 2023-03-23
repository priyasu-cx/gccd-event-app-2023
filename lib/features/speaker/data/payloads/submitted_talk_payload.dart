import 'package:freezed_annotation/freezed_annotation.dart';

part 'submitted_talk_payload.freezed.dart';

part 'submitted_talk_payload.g.dart';

@freezed
class SubmittedTalkPayload with _$SubmittedTalkPayload {
  const factory SubmittedTalkPayload({
    int? id,
    required String description,
    required String overview,
    required String title,
    required String format,
    String? status,
    required List<int> technologies,
    required List<int> speakers,
    required int event,
    @JsonKey(name : 'added_at') String? addedAt,
  }) = _SubmittedTalkPayload;

  factory SubmittedTalkPayload.fromJson(Map<String, dynamic> json) =>
      _$SubmittedTalkPayloadFromJson(json);
}

// speakers: number[];
