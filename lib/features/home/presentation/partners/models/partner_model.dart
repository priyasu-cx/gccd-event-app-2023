import 'package:freezed_annotation/freezed_annotation.dart';
part 'partner_model.freezed.dart';
part 'partner_model.g.dart';

@freezed
class Partners with _$Partners {
  const factory Partners({
    required String sponsorId,
    required String sponsorName,
    required String hyperlink,
    required String imgSrc,
  }) = _Partners;

  factory Partners.fromJson(Map<String, dynamic> json) =>
      _$PartnersFromJson(json);
}