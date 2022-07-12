import 'dart:convert';

import '../../common/contrains/string.dart';
import '../../data/Posts.dart';
import 'package:http/http.dart' as http;

class PostProvider {
  static Future<Posts> getAllPost() async {
    String? token = await getToken();
    var response = await http.get(
      Uri.parse(getAllposts),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token!}'
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      var studentObject = Posts.fromJson(json.decode(response.body));
      return studentObject;
    } else {
      return new Posts();
    }
  }
}
