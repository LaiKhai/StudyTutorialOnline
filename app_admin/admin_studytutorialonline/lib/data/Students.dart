class Students {
  List<Only_Student>? only_student;

  Students({this.only_student});

  Students.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      only_student = <Only_Student>[];
      json['data'].forEach((v) {
        only_student!.add(new Only_Student.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> only_student = new Map<String, dynamic>();
    if (this.only_student != null) {
      only_student['data'] = this.only_student!.map((v) => v.toJson()).toList();
    }
    return only_student;
  }
}

class Only_Student {
  int? id;
  Null? idKhoa;
  Null? idChucVu;
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
  int? idGiangvien;
  String? tenLop;
  String? nienKhoa;

  Only_Student(
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
      this.idGiangvien,
      this.tenLop,
      this.nienKhoa});

  Only_Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKhoa = json['id_khoa'];
    idChucVu = json['id_chuc_vu'];
    idLop = json['id_lop'];
    email = json['email'];
    password = json['password'];
    if (json['avt'] == null) {
      avt = '/assets/images/no_image.png';
    } else {
      avt = json['avt'];
    }

    maSo = json['ma_so'];
    sdt = json['sdt'];
    hoTen = json['ho_ten'];
    ngaySinh = json['ngay_sinh'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    idGiangvien = json['id_giangvien'];
    tenLop = json['ten_lop'];
    nienKhoa = json['nien_khoa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> only_student = new Map<String, dynamic>();
    only_student['id'] = this.id;
    only_student['id_khoa'] = this.idKhoa;
    only_student['id_chuc_vu'] = this.idChucVu;
    only_student['id_lop'] = this.idLop;
    only_student['email'] = this.email;
    only_student['password'] = this.password;
    only_student['avt'] = this.avt;
    only_student['ma_so'] = this.maSo;
    only_student['sdt'] = this.sdt;
    only_student['ho_ten'] = this.hoTen;
    only_student['ngay_sinh'] = this.ngaySinh;
    only_student['trang_thai'] = this.trangThai;
    only_student['created_at'] = this.createdAt;
    only_student['updated_at'] = this.updatedAt;
    only_student['id_giangvien'] = this.idGiangvien;
    only_student['ten_lop'] = this.tenLop;
    only_student['nien_khoa'] = this.nienKhoa;
    return only_student;
  }
}
