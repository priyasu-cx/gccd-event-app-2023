import 'package:freezed_annotation/freezed_annotation.dart';
part 'partner_model.freezed.dart';
part 'partner_model.g.dart';

@freezed
class Partners with _$Partners {
  const factory Partners(
      {required List<SponsorDetails> partners,
      required String title,
      required String description,
      required CommunityPartners community_partners,
      required}) = _Partners;

  factory Partners.fromJson(Map<String, dynamic> json) =>
      _$PartnersFromJson(json);
}

@freezed
class CommunityPartners with _$CommunityPartners {
  const factory CommunityPartners({
    required String title,
    required String description,
    required List<Sponsors> sponsors,
  }) = _CommunityPartners;

  factory CommunityPartners.fromJson(Map<String, dynamic> json) =>
      _$CommunityPartnersFromJson(json);
}

@freezed
class SponsorDetails with _$SponsorDetails {
  const factory SponsorDetails({
    required String? title,
    required List<Sponsors?>? sponsors,
  }) = _SponsorDetails;

  factory SponsorDetails.fromJson(Map<String, dynamic> json) =>
      _$SponsorDetailsFromJson(json);
}

@freezed
class Sponsors with _$Sponsors {
  const factory Sponsors({
    required String? sponsorId,
    required String? sponsorName,
    required String? hyperlink,
    required String? imgSrc,
  }) = _Sponsors;

  factory Sponsors.fromJson(Map<String, dynamic> json) =>
      _$SponsorsFromJson(json);
}




// class CommunityPartners {
//   final String title;
//   final String communityPartnerName;
//   final String hyperlink;
//   final String imgSrc;
//
//   CommunityPartners({required this.communityPartnerId, required this.communityPartnerName ,required this.hyperlink, required this.imgSrc});
//
//   factory CommunityPartners.fromJson(Map<String, dynamic> json) {
//     return CommunityPartners(
//       communityPartnerId: json['communityPartnerId'],
//       communityPartnerName: json['communityPartnerName'],
//       hyperlink: json['hyperlink'],
//       imgSrc: json['imgSrc'],
//     );
//   }
// }


// class Sponsors {
//   final String sponsorId;
//   final String sponsorName;
//   final String hyperlink;
//   final String imgSrc;
//
//   Sponsors({required this.sponsorId, required this.sponsorName ,required this.hyperlink, required this.imgSrc});
//
//   factory Sponsors.fromJson(Map<String, dynamic> json) {
//     return Sponsors(
//       sponsorId: json['sponsorId'],
//       sponsorName: json['sponsorName'],
//       hyperlink: json['hyperlink'],
//       imgSrc: json['imgSrc'],
//     );
//   }
// }