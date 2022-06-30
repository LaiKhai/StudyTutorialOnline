class bai_Viet {
  String? message;
  Baiviet? baiviet;

  bai_Viet({this.message, this.baiviet});

  bai_Viet.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    baiviet =
        json['baiviet'] != null ? new Baiviet.fromJson(json['baiviet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.baiviet != null) {
      data['baiviet'] = this.baiviet!.toJson();
    }
    return data;
  }
}

class Baiviet {
  String? idLopHocPhan;
  String? idLoaiBaiViet;
  String? noiDung;
  int? trangThai;
  String? updatedAt;
  String? createdAt;
  int? id;
  Lophocphan? lophocphan;
  Loaibaiviet? loaibaiviet;

  Baiviet(
      {this.idLopHocPhan,
      this.idLoaiBaiViet,
      this.noiDung,
      this.trangThai,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.lophocphan,
      this.loaibaiviet});

  Baiviet.fromJson(Map<String, dynamic> json) {
    idLopHocPhan = json['id_lop_hoc_phan'];
    idLoaiBaiViet = json['id_loai_bai_viet'];
    noiDung = json['noi_dung'];
    trangThai = json['trang_thai'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    lophocphan = json['lophocphan'] != null
        ? new Lophocphan.fromJson(json['lophocphan'])
        : null;
    loaibaiviet = json['loaibaiviet'] != null
        ? new Loaibaiviet.fromJson(json['loaibaiviet'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_lop_hoc_phan'] = this.idLopHocPhan;
    data['id_loai_bai_viet'] = this.idLoaiBaiViet;
    data['noi_dung'] = this.noiDung;
    data['trang_thai'] = this.trangThai;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    if (this.lophocphan != null) {
      data['lophocphan'] = this.lophocphan!.toJson();
    }
    if (this.loaibaiviet != null) {
      data['loaibaiviet'] = this.loaibaiviet!.toJson();
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
