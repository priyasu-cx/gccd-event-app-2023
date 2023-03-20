import 'package:freezed_annotation/freezed_annotation.dart';

part 'talk_payload.freezed.dart';

part 'talk_payload.g.dart';

@freezed
class TalkPayload with _$TalkPayload {
  const factory TalkPayload({
    int? id,
    required String description,
    required String overview,
    required String title,
    required String format,
    String? status,
    required List<int> technologies,
    required List<int> speakers,
    required int event,
  }) = _TalkPayload;

  factory TalkPayload.fromJson(Map<String, dynamic> json) =>
      _$TalkPayloadFromJson(json);
}

// speakers: number[];
