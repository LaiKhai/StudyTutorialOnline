import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../data/Department.dart';

class ClassPartProvider {
  static List<Department> parseObject(String reponseBody) {
    final parsed = jsonDecode(reponseBody)['khoa'].cast<Map<String, dynamic>>();
    return parsed;
  }

  static Future<List<Department>> fetchObject() async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(fetchDepartmentObject), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    return parseObject(response.body);
  }
}
