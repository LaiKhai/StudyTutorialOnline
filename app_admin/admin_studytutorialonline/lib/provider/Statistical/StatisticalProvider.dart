import 'dart:convert';

import 'package:admin_studytutorialonline/data/Statistical.dart';
import 'package:http/http.dart' as http;
import '../../common/contrains/string.dart';

class StatisticalProvider {
  static List<Statistical> parseObject(String reponseBody) {
    final parsed =
        jsonDecode(reponseBody)['sinhvien'].cast<Map<String, dynamic>>();
    return parsed.map<Statistical>((e) => Statistical.fromJson(e)).toList();
  }

  static Future<List<Statistical>> fetchObject() async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(fetchClassObject), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    return parseObject(response.body);
  }
}
