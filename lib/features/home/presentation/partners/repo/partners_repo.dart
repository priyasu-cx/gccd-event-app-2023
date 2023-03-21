import 'dart:convert';

import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/home/presentation/partners/models/partner_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;


class PartnersRepository {
  final DioApiClient _dioApiClient;

  PartnersRepository(this._dioApiClient);

  Future<List<Partners>> getPartners() async {
    // final response = await http.get(Uri.parse('https://raw.githubusercontent.com/gdgcloudkol/ccd2023/prod/src/assets/content/partners/content.json'));
    final response = await _dioApiClient.getPartnerData(endPoint: 'https://raw.githubusercontent.com/gdgcloudkol/ccd2023/prod/src/assets/content/partners/content.json');
    print("response: $response");

    List<Partners> partners = [];
    if (response.statusCode == 200) {
      // final partners = json.decode(response.body);
      for (var partner in response.data["community_partners"]["sponsors"]) {
        print("partner: $partner");
        partners.add(Partners.fromJson(partner));
      }
    } else {
      throw Exception('Failed to load partners');
    }
    return partners;
  }
}
