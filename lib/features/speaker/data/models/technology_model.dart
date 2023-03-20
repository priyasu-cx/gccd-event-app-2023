import 'package:freezed_annotation/freezed_annotation.dart';

part 'technology_model.freezed.dart';
part 'technology_model.g.dart';

@freezed
class Technology with _$Technology {
  const factory Technology({
    required int id,
    required String name,
    required String description,
    required String slug,
  }) = _Technology;

  factory Technology.fromJson(Map<String, dynamic> json) =>
      _$TechnologyFromJson(json);
}
