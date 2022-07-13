import 'package:admin_studytutorialonline/data/Teacher.dart';

class Khoas {
  bool? status;
  List<Khoa>? khoa;

  Khoas({this.status, this.khoa});

  Khoas.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['khoa'] != null) {
      khoa = <Khoa>[];
      json['khoa'].forEach((v) {
        khoa!.add(new Khoa.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.khoa != null) {
      data['khoa'] = this.khoa!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

