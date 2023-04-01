
import 'dart:convert';

import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/home/presentation/partners/models/partner_model.dart';


class PartnersRepository {
  final DioApiClient _dioApiClient;

  PartnersRepository(this._dioApiClient);

  Future<Partners> getPartners() async {
    final response = await _dioApiClient.getPartnerData(endPoint: 'https://raw.githubusercontent.com/gdgcloudkol/ccd2023/prod/src/assets/content/partners/content.json');

    Partners partners;

    if (response.statusCode == 200) {
      final responseMap = json.decode(response.data);
      partners = Partners.fromJson(responseMap);
    } else {
      throw Exception('Failed to load partners');
    }
    return partners;
  }
}
