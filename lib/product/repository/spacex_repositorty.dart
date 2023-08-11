import 'dart:convert';

import 'package:spacex_latest_launch/product/constans/string_constans.dart';
import 'package:spacex_latest_launch/product/models/spacex_model.dart';
import 'package:http/http.dart' as http;

class SpacexRepository {
  final String _baseUrl = StringConstans.baseUrl;

  Future<SpacexModel> getLatestLaunch() async {
    var response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return SpacexModel.fromMap(json.decode(response.body));
    } else {
      throw Exception(StringConstans.failLoadData);
    }
  }
}
