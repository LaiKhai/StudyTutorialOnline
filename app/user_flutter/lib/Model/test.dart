import 'package:user_flutter/Model/tao_CauHoi.dart';

class Tao_cauHoi {
  List<Cauhoi_Ktra>? listCauhoi;

  Tao_cauHoi({this.listCauhoi});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listCauhoi != null) {
      data['List_cauhoi'] = this.listCauhoi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
