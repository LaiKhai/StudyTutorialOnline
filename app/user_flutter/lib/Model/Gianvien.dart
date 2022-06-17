class GiangVien {
  String? message;
  Giangvien? giangvien;
  String? token;

  GiangVien({this.message, this.giangvien, this.token});

  GiangVien.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    giangvien = json['giangvien'] != null
        ? new Giangvien.fromJson(json['giangvien'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.giangvien != null) {
      data['giangvien'] = this.giangvien!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Giangvien {
  int? id;
  Null? idKhoa;
  int? idChucVu;
  String? email;
  String? password;
  Null? avt;
  String? msgv;
  String? sdt;
  String? hoTen;
  String? ngaySinh;
  int? trangThai;
  String? createdAt;
  String? updatedAt;

  Giangvien(
      {this.id,
      this.idKhoa,
      this.idChucVu,
      this.email,
      this.password,
      this.avt,
      this.msgv,
      this.sdt,
      this.hoTen,
      this.ngaySinh,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Giangvien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKhoa = json['id_khoa'];
    idChucVu = json['id_chuc_vu'];
    email = json['email'];
    password = json['password'];
    avt = json['avt'];
    msgv = json['msgv'];
    sdt = json['sdt'];
    hoTen = json['ho_ten'];
    ngaySinh = json['ngay_sinh'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_khoa'] = this.idKhoa;
    data['id_chuc_vu'] = this.idChucVu;
    data['email'] = this.email;
    data['password'] = this.password;
    data['avt'] = this.avt;
    data['msgv'] = this.msgv;
    data['sdt'] = this.sdt;
    data['ho_ten'] = this.hoTen;
    data['ngay_sinh'] = this.ngaySinh;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
