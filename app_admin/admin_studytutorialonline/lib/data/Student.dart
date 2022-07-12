class Student {
  bool? status;
  List<SinhVien>? sinhvien;

  Student({this.status, this.sinhvien});

  Student.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['user'] != null) {
      sinhvien = <SinhVien>[];
      json['user'].forEach((v) {
        sinhvien!.add(new SinhVien.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.sinhvien != null) {
      data['user'] = this.sinhvien!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SinhVien {
  int? id;
  Null? idKhoa;
  Null? idChucVu;
  int? idLop;
  String? email;
  String? password;
  Null? avt;
  String? maSo;
  String? sdt;
  String? hoTen;
  String? ngaySinh;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  String? tenLop;
  String? nienKhoa;

  SinhVien(
      {this.id,
      this.idKhoa,
      this.idChucVu,
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
      this.updatedAt,
      this.tenLop,
      this.nienKhoa});

  SinhVien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKhoa = json['id_khoa'];
    idChucVu = json['id_chuc_vu'];
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
    tenLop = json['ten_lop'];
    nienKhoa = json['nien_khoa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_khoa'] = this.idKhoa;
    data['id_chuc_vu'] = this.idChucVu;
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
    data['ten_lop'] = this.tenLop;
    data['nien_khoa'] = this.nienKhoa;
    return data;
  }
}
