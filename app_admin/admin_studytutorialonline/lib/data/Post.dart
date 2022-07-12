class Post {
  bool? status;
  Baiviet? baiviet;
  List<File>? file;

  Post({this.status, this.baiviet, this.file});

  Post.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    baiviet =
        json['baiviet'] != null ? new Baiviet.fromJson(json['baiviet']) : null;
    if (json['file'] != null) {
      file = <File>[];
      json['file'].forEach((v) {
        file!.add(new File.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.baiviet != null) {
      data['baiviet'] = this.baiviet!.toJson();
    }
    if (this.file != null) {
      data['file'] = this.file!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Baiviet {
  int? id;
  int? idLopHocPhan;
  int? idLoaiBaiViet;
  int? idSinhVien;
  Null? idGiangVien;
  String? noiDung;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  Lophocphan? lophocphan;
  Loaibaiviet? loaibaiviet;
  Sinhvien? sinhvien;

  Baiviet(
      {this.id,
      this.idLopHocPhan,
      this.idLoaiBaiViet,
      this.idSinhVien,
      this.idGiangVien,
      this.noiDung,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.lophocphan,
      this.loaibaiviet,
      this.sinhvien});

  Baiviet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLopHocPhan = json['id_lop_hoc_phan'];
    idLoaiBaiViet = json['id_loai_bai_viet'];
    idSinhVien = json['id_sinh_vien'];
    idGiangVien = json['id_giang_vien'];
    noiDung = json['noi_dung'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lophocphan = json['lophocphan'] != null
        ? new Lophocphan.fromJson(json['lophocphan'])
        : null;
    loaibaiviet = json['loaibaiviet'] != null
        ? new Loaibaiviet.fromJson(json['loaibaiviet'])
        : null;
    sinhvien = json['sinhvien'] != null
        ? new Sinhvien.fromJson(json['sinhvien'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_lop_hoc_phan'] = this.idLopHocPhan;
    data['id_loai_bai_viet'] = this.idLoaiBaiViet;
    data['id_sinh_vien'] = this.idSinhVien;
    data['id_giang_vien'] = this.idGiangVien;
    data['noi_dung'] = this.noiDung;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.lophocphan != null) {
      data['lophocphan'] = this.lophocphan!.toJson();
    }
    if (this.loaibaiviet != null) {
      data['loaibaiviet'] = this.loaibaiviet!.toJson();
    }
    if (this.sinhvien != null) {
      data['sinhvien'] = this.sinhvien!.toJson();
    }
    return data;
  }
}

class Lophocphan {
  int? id;
  int? idBoMon;
  int? idLop;
  String? avt;
  int? trangThai;
  String? createdAt;
  String? updatedAt;

  Lophocphan(
      {this.id,
      this.idBoMon,
      this.idLop,
      this.avt,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Lophocphan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBoMon = json['id_bo_mon'];
    idLop = json['id_lop'];
    avt = json['avt'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_bo_mon'] = this.idBoMon;
    data['id_lop'] = this.idLop;
    data['avt'] = this.avt;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Loaibaiviet {
  int? id;
  String? tenLoai;
  int? trangThai;
  String? createdAt;
  String? updatedAt;

  Loaibaiviet(
      {this.id, this.tenLoai, this.trangThai, this.createdAt, this.updatedAt});

  Loaibaiviet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenLoai = json['ten_loai'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten_loai'] = this.tenLoai;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Sinhvien {
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

  Sinhvien(
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
      this.updatedAt});

  Sinhvien.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class File {
  int? id;
  String? noiDung;
  String? tenFile;
  String? loaiFile;
  int? trangThai;
  String? createdAt;
  String? updatedAt;

  File(
      {this.id,
      this.noiDung,
      this.tenFile,
      this.loaiFile,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  File.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noiDung = json['noi_dung'];
    tenFile = json['ten_file'];
    loaiFile = json['loai_file'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['noi_dung'] = this.noiDung;
    data['ten_file'] = this.tenFile;
    data['loai_file'] = this.loaiFile;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
