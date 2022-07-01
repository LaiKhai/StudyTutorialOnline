import 'dart:convert';

import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:admin_studytutorialonline/data/ClassRoom.dart';
import 'package:http/http.dart' as http;

class ClassRoomProvider {
  static List<ClassRoom> parseObject(String reponseBody) {
    final parsed = jsonDecode(reponseBody)['lop'].cast<Map<String, dynamic>>();
    return parsed.map<ClassRoom>((e) => ClassRoom.fromJson(e)).toList();
  }

  static Future<List<ClassRoom>> fetchObject() async {
    String? token = await getToken();
    final response = await http.get(Uri.parse(fetchClassObject), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    });
    return parseObject(response.body);
  }
}
