class BinhLuanM {
  bool? status;
  List<Binhluan>? binhluan;

  BinhLuanM({this.status, this.binhluan});

  BinhLuanM.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['binhluan'] != null) {
      binhluan = <Binhluan>[];
      json['binhluan'].forEach((v) {
        binhluan!.add(new Binhluan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.binhluan != null) {
      data['binhluan'] = this.binhluan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Binhluan {
  int? id;
  int? idBaiViet;
  int? idSinhVien;
  String? noiDung;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  Sinhvien? sinhvien;

  Binhluan(
      {this.id,
      this.idBaiViet,
      this.idSinhVien,
      this.noiDung,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.sinhvien});

  Binhluan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBaiViet = json['id_bai_viet'];
    idSinhVien = json['id_sinh_vien'];
    noiDung = json['noi_dung'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sinhvien = json['sinhvien'] != null
        ? new Sinhvien.fromJson(json['sinhvien'])
        : null;
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
    if (this.sinhvien != null) {
      data['sinhvien'] = this.sinhvien!.toJson();
    }
    return data;
  }
}

class Sinhvien {
  int? id;
  int? idLop;
  String? email;
  String? password;
  String? avt;
  String? maSo;
  String? sdt;
  String? hoTen;
  String? ngaySinh;
  int? trangThai;
  String? createdAt;
  String? updatedAt;

  Sinhvien(
      {this.id,
      this.idLop,
      this.email,
      this.password,
      this.avt,
      this.maSo,
      this.sdt,
      this.hoTen,
      this.ngaySinh,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Sinhvien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLop = json['id_lop'];
    email = json['email'];
    password = json['password'];
    avt = json['avt'];
    maSo = json['ma_so'];
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
    data['id_lop'] = this.idLop;
    data['email'] = this.email;
    data['password'] = this.password;
    data['avt'] = this.avt;
    data['ma_so'] = this.maSo;
    data['sdt'] = this.sdt;
    data['ho_ten'] = this.hoTen;
    data['ngay_sinh'] = this.ngaySinh;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
