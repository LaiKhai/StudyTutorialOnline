class BinhLuansM {
  bool? status;
  List<BinhLuanM>? data;

  BinhLuansM({this.status, this.data});

  BinhLuansM.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <BinhLuanM>[];
      json['data'].forEach((v) {
        data!.add(new BinhLuanM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BinhLuanM {
  int? id;
  int? idBaiViet;
  int? idSinhVien;
  String? noiDung;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  String? hoTen;

  BinhLuanM(
      {this.id,
      this.idBaiViet,
      this.idSinhVien,
      this.noiDung,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.hoTen});

  BinhLuanM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBaiViet = json['id_bai_viet'];
    idSinhVien = json['id_sinh_vien'];
    noiDung = json['noi_dung'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    idBaiViet = json['idBaiViet'];
    hoTen = json['ho_ten'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_bai_viet'] = this.idBaiViet;
    data['id_sinh_vien'] = this.idSinhVien;
    data['noi_dung'] = this.noiDung;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['idBaiViet'] = this.idBaiViet;
    data['ho_ten'] = this.hoTen;
    return data;
  }
}
