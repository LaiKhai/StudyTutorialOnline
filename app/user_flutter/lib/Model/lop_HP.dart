import 'package:user_flutter/Model/User_login.dart';

class lop_HP {
  List<Lophocphan>? lophocphan;

  lop_HP({this.lophocphan});

  lop_HP.fromJson(Map<String, dynamic> json) {
    if (json['lophocphan'] != null) {
      lophocphan = <Lophocphan>[];
      json['lophocphan'].forEach((v) {
        if (user.user!.idChucVu != 0) {
          lophocphan!.add(new Lophocphan.fromJsonGV(v));
        } else
          lophocphan!.add(new Lophocphan.fromJsonSV(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lophocphan != null) {
      data['lophocphan'] = this.lophocphan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lophocphan {
  int? idSinhVien;
  int? id;
  int? idBoMon;
  int? idLop;
  String? avt;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  String? hoTenSv;
  String? tenMonHoc;
  String? tenLop;

  Lophocphan(
      {this.idSinhVien,
      this.id,
      this.idBoMon,
      this.idLop,
      this.avt,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.hoTenSv,
      this.tenMonHoc,
      this.tenLop});

  Lophocphan.fromJsonSV(Map<String, dynamic> json) {
    idSinhVien = json['id_sinh_vien'];
    id = json['id'];
    idBoMon = json['id_bo_mon'];
    idLop = json['id_lop'];
    if (json['avt'] == null) {
      json['avt'] = 'storage/assets/images/lophocphan/no_image.jpg';
    } else {
      avt = json['avt'];
    }
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hoTenSv = json['ho_ten_sv'];
    tenMonHoc = json['ten_mon_hoc'];
    tenLop = json['ten_lop'];
  }
  Lophocphan.fromJsonGV(Map<String, dynamic> json) {
    idSinhVien = json['id_giang_vien'];
    id = json['id'];
    idBoMon = json['id_bo_mon'];
    idLop = json['id_lop'];
    if (json['avt'] == null) {
      json['avt'] = 'assets/images/lophocphan/no_image.jpg';
    } else {
      avt = json['avt'];
    }
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hoTenSv = json['ho_ten_gv'];
    tenMonHoc = json['ten_mon_hoc'];
    tenLop = json['ten_lop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_sinh_vien'] = this.idSinhVien;
    data['id'] = this.id;
    data['id_bo_mon'] = this.idBoMon;
    data['id_lop'] = this.idLop;
    data['avt'] = this.avt;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['ho_ten_sv'] = this.hoTenSv;
    data['ten_mon_hoc'] = this.tenMonHoc;
    data['ten_lop'] = this.tenLop;
    return data;
  }
}
