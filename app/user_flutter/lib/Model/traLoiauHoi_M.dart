class traLoiCauHoi_M {
  bool? status;
  List<Tt_TraLoi>? data;

  traLoiCauHoi_M({this.status, this.data});

  traLoiCauHoi_M.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Tt_TraLoi>[];
      json['data'].forEach((v) {
        data!.add(new Tt_TraLoi.fromJson(v));
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

class Tt_TraLoi {
  int? idBaiViet;
  String? cauTraLoi;
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
  String? tenLop;
  String? noiDung;
  String? tenFile;
  String? loaiFile;
  int? idLoaiBaiViet;

  Tt_TraLoi(
      {this.idBaiViet,
      this.cauTraLoi,
      this.id,
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
      this.noiDung,
      this.tenFile,
      this.loaiFile,
      this.idLoaiBaiViet});

  Tt_TraLoi.fromJson(Map<String, dynamic> json) {
    idBaiViet = json['id_bai_viet'];
    cauTraLoi = json['cau_tra_loi'];
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
    tenLop = json['ten_lop'];
    noiDung = json['noi_dung'];
    tenFile = json['ten_file'];
    loaiFile = json['loai_file'];
    idLoaiBaiViet = json['id_loai_bai_viet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_bai_viet'] = this.idBaiViet;
    data['cau_tra_loi'] = this.cauTraLoi;
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
    data['ten_lop'] = this.tenLop;
    data['noi_dung'] = this.noiDung;
    data['ten_file'] = this.tenFile;
    data['loai_file'] = this.loaiFile;
    data['id_loai_bai_viet'] = this.idLoaiBaiViet;
    return data;
  }
}
