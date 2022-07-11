import 'dart:convert';

import 'package:admin_studytutorialonline/data/Statistical.dart';
import 'package:http/http.dart' as http;
import '../../common/contrains/string.dart';

class StatisticalProvider {
  static Statistical parseObject(String reponseBody) {
    final parsed = Statistical.fromJson(json.decode(reponseBody));
    return parsed;
  }

  static Future<Statistical> fetchObject() async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(fetchStatisticalObject),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        });
    return parseObject(response.body);
  }
}
