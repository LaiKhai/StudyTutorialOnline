class ClassPartCreate {
  bool? status;
  String? message;
  Lophocphan? lophocphan;

  ClassPartCreate({this.status, this.message, this.lophocphan});

  ClassPartCreate.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    lophocphan = json['lophocphan'] != null
        ? new Lophocphan.fromJson(json['lophocphan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.lophocphan != null) {
      data['lophocphan'] = this.lophocphan!.toJson();
    }
    return data;
  }
}

class Lophocphan {
  String? idBoMon;
  String? idLop;
  String? trangThai;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? avt;
  Lop? lop;
  Bomon? bomon;

  Lophocphan({
    this.idBoMon,
    this.idLop,
    this.trangThai,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.avt,
    this.lop,
    this.bomon,
  });

  Lophocphan.fromJson(Map<String, dynamic> json) {
    idBoMon = json['id_bo_mon'];
    idLop = json['id_lop'];
    trangThai = json['trang_thai'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    avt = json['avt'];
    lop = json['lop'] != null ? new Lop.fromJson(json['lop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_bo_mon'] = this.idBoMon;
    data['id_lop'] = this.idLop;
    data['trang_thai'] = this.trangThai;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['avt'] = this.avt;
    if (this.lop != null) {
      data['lop'] = this.lop!.toJson();
    }

    return data;
  }
}

class Lop {
  int? id;
  int? idGiangvien;
  int? idKhoa;
  String? tenLop;
  String? nienKhoa;
  int? trangThai;
  String? createdAt;
  String? updatedAt;

  Lop(
      {this.id,
      this.idGiangvien,
      this.idKhoa,
      this.tenLop,
      this.nienKhoa,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Lop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idGiangvien = json['id_giangvien'];
    idKhoa = json['id_khoa'];
    tenLop = json['ten_lop'];
    nienKhoa = json['nien_khoa'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_giangvien'] = this.idGiangvien;
    data['id_khoa'] = this.idKhoa;
    data['ten_lop'] = this.tenLop;
    data['nien_khoa'] = this.nienKhoa;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Bomon {
  int? id;
  int? idKhoa;
  String? tenMonHoc;
  int? loaiMonHoc;
  int? trangThai;
  Null? createdAt;
  String? updatedAt;

  Bomon(
      {this.id,
      this.idKhoa,
      this.tenMonHoc,
      this.loaiMonHoc,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Bomon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKhoa = json['id_khoa'];
    tenMonHoc = json['ten_mon_hoc'];
    loaiMonHoc = json['loai_mon_hoc'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_khoa'] = this.idKhoa;
    data['ten_mon_hoc'] = this.tenMonHoc;
    data['loai_mon_hoc'] = this.loaiMonHoc;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
