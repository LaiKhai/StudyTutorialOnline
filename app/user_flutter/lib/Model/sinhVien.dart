class SinhVien {
  String? message;
  Sinhvien? sinhvien;
  String? token;

  SinhVien({this.message, this.sinhvien, this.token});

  SinhVien.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sinhvien = json['sinhvien'] != null
        ? new Sinhvien.fromJson(json['sinhvien'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.sinhvien != null) {
      data['sinhvien'] = this.sinhvien!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Sinhvien {
  int? id;
  Null? idLop;
  String? email;
  String? password;
  String? hoTen;
  String? avt;
  String? mssv;
  String? sdt;
  String? ngaySinh;
  int? trangThai;
  String? createdAt;
  String? updatedAt;

  Sinhvien(
      {this.id,
      this.idLop,
      this.email,
      this.password,
      this.hoTen,
      this.avt,
      this.mssv,
      this.sdt,
      this.ngaySinh,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Sinhvien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLop = json['id_lop'];
    email = json['email'];
    password = json['password'];
    hoTen = json['ho_ten'];
    avt = json['avt'];
    mssv = json['mssv'];
    sdt = json['sdt'];
    ngaySinh = json['ngay_sinh'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_lop'] = this.idLop;
    data['email'] = this.email;
    data['password'] = this.password;
    data['ho_ten'] = this.hoTen;
    data['avt'] = this.avt;
    data['mssv'] = this.mssv;
    data['sdt'] = this.sdt;
    data['ngay_sinh'] = this.ngaySinh;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
