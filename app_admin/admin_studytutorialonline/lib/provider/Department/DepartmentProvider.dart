import 'dart:convert';

import 'package:admin_studytutorialonline/data/Department.dart';
import 'package:http/http.dart' as http;
import '../../common/contrains/string.dart';

class DepartmentProvider {
  static List<Department> parseObject(String reponseBody) {
    final parsed = jsonDecode(reponseBody)['khoa'].cast<Map<String, dynamic>>();
    return parsed.map<Department>((e) => Department.fromJson(e)).toList();
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
