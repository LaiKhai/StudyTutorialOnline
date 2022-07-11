import 'dart:convert';

import 'package:admin_studytutorialonline/common/contrains/string.dart';
import 'package:admin_studytutorialonline/data/Subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SubjectProvider {
  Future<void> createSubject(BuildContext context, int id_khoa,
      String ten_mon_hoc, int loai_mon_hoc) async {
    String? token = await getToken();
    Map body = {
      'id_khoa': id_khoa,
      'ten_mon_hoc': ten_mon_hoc,
      'loai_mon_hoc': loai_mon_hoc
    };
    var response = await http.post(Uri.parse(createSubjectObject),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}'
        },
        body: body);
    if (response.statusCode == 200) {
      final jsonResponse = Subject.fromJson(json.decode(response.body));
    }
  }
}
