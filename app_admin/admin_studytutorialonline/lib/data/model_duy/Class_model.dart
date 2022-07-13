class ClassModel {
  bool? status;
  Lop? lop;

  ClassModel({this.status, this.lop});

  ClassModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    lop = json['lop'] != null ? new Lop.fromJson(json['lop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.lop != null) {
      data['lop'] = this.lop!.toJson();
    }
    return data;
  }
}

class Lop {
  int? id;
  int? idGiangvien;
  String? tenLop;
  String? nienKhoa;
  int? trangThai;
  String? updatedAt;
  Giangvien? giangvien;

  Lop(
      {this.id,
      this.idGiangvien,
      this.tenLop,
      this.nienKhoa,
      this.trangThai,
      this.updatedAt,
      this.giangvien});

  Lop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idGiangvien = json['id_giangvien'];
    tenLop = json['ten_lop'];
    nienKhoa = json['nien_khoa'];
    trangThai = json['trang_thai'];
    updatedAt = json['updated_at'];
    giangvien = json['giangvien'] != null
        ? new Giangvien.fromJson(json['giangvien'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_giangvien'] = this.idGiangvien;
    data['ten_lop'] = this.tenLop;
    data['nien_khoa'] = this.nienKhoa;
    data['trang_thai'] = this.trangThai;
    data['updated_at'] = this.updatedAt;
    if (this.giangvien != null) {
      data['giangvien'] = this.giangvien!.toJson();
    }
    return data;
  }
}

class Giangvien {
  int? id;
  int? idKhoa;
  int? idChucVu;
  String? email;
  String? password;
  String? maSo;
  String? sdt;
  String? hoTen;
  String? ngaySinh;
  int? trangThai;
  String? updatedAt;

  Giangvien(
      {this.id,
      this.idKhoa,
      this.idChucVu,
      this.email,
      this.password,
      this.maSo,
      this.sdt,
      this.hoTen,
      this.ngaySinh,
      this.trangThai,
      this.updatedAt});

  Giangvien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKhoa = json['id_khoa'];
    idChucVu = json['id_chuc_vu'];
    email = json['email'];
    password = json['password'];
    maSo = json['ma_so'];
    sdt = json['sdt'];
    hoTen = json['ho_ten'];
    ngaySinh = json['ngay_sinh'];
    trangThai = json['trang_thai'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_khoa'] = this.idKhoa;
    data['id_chuc_vu'] = this.idChucVu;
    data['email'] = this.email;
    data['password'] = this.password;
    data['ma_so'] = this.maSo;
    data['sdt'] = this.sdt;
    data['ho_ten'] = this.hoTen;
    data['ngay_sinh'] = this.ngaySinh;
    data['trang_thai'] = this.trangThai;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
