import 'package:user_flutter/Model_View/login.dart';
import 'package:user_flutter/View/common/constant/string.dart';
import 'package:http/http.dart' as http;

class BinhLuan_MV {
  static Future<bool> postBinhLuan(String idBaiviet,String idSinhVien,String noiDung ) async{
     String token = await Login.getToken();
   
    String url = urlBinhLuan;
    Map body = {
        "id_bai_viet": idBaiviet.toString(),
        "id_sinh_vien": idSinhVien.toString(),
        "noi_dung":noiDung
      };
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },  
        body: body  );
    return true;
  }




}
