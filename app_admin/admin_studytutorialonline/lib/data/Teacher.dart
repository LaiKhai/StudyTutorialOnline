class Teacher {
  bool? status;
  GiangVien? giangvien;

  Teacher({this.status, this.giangvien});

  Teacher.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    giangvien =
        json['user'] != null ? new GiangVien.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.giangvien != null) {
      data['user'] = this.giangvien!.toJson();
    }
    return data;
  }
}

class GiangVien {
  int? id;
  int? idKhoa;
  int? idChucVu;
  Null? idLop;
  String? email;
  String? password;
  String? avt;
  String? maSo;
  String? sdt;
  String? hoTen;
  String? ngaySinh;
  int? trangThai;
  Null? createdAt;
  String? updatedAt;
  Khoa? khoa;
  Chucvu? chucvu;
  List<Baikiemtra>? baikiemtra;
  List<Lop>? lop;
  List<Baiviet>? baiviet;

  GiangVien(
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
      this.khoa,
      this.chucvu,
      this.baikiemtra,
      this.lop,
      this.baiviet});

  GiangVien.fromJson(Map<String, dynamic> json) {
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
    khoa = json['khoa'] != null ? new Khoa.fromJson(json['khoa']) : null;
    chucvu =
        json['chucvu'] != null ? new Chucvu.fromJson(json['chucvu']) : null;
    if (json['baikiemtra'] != null) {
      baikiemtra = <Baikiemtra>[];
      json['baikiemtra'].forEach((v) {
        baikiemtra!.add(new Baikiemtra.fromJson(v));
      });
    }
    if (json['lop'] != null) {
      lop = <Lop>[];
      json['lop'].forEach((v) {
        lop!.add(new Lop.fromJson(v));
      });
    }
    if (json['baiviet'] != null) {
      baiviet = <Baiviet>[];
      json['baiviet'].forEach((v) {
        baiviet!.add(new Baiviet.fromJson(v));
      });
    }
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
    if (this.khoa != null) {
      data['khoa'] = this.khoa!.toJson();
    }
    if (this.chucvu != null) {
      data['chucvu'] = this.chucvu!.toJson();
    }
    if (this.baikiemtra != null) {
      data['baikiemtra'] = this.baikiemtra!.map((v) => v.toJson()).toList();
    }
    if (this.lop != null) {
      data['lop'] = this.lop!.map((v) => v.toJson()).toList();
    }
    if (this.baiviet != null) {
      data['baiviet'] = this.baiviet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Khoa {
  int? id;
  String? tenKhoa;
  int? trangThai;
  Null? createdAt;
  Null? updatedAt;

  Khoa({this.id, this.tenKhoa, this.trangThai, this.createdAt, this.updatedAt});

  Khoa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenKhoa = json['ten_khoa'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten_khoa'] = this.tenKhoa;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Chucvu {
  int? id;
  String? tenChucVu;
  int? trangThai;
  Null? createdAt;
  Null? updatedAt;

  Chucvu(
      {this.id,
      this.tenChucVu,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Chucvu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenChucVu = json['ten_chuc_vu'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten_chuc_vu'] = this.tenChucVu;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Baikiemtra {
  int? id;
  int? idLopHocPhan;
  int? idGiangVien;
  Null? idFile;
  int? slCauHoi;
  String? tieuDe;
  String? noiDung;
  String? tgBatDau;
  String? tgKetThuc;
  int? trangThai;
  String? createdAt;
  String? updatedAt;

  Baikiemtra(
      {this.id,
      this.idLopHocPhan,
      this.idGiangVien,
      this.idFile,
      this.slCauHoi,
      this.tieuDe,
      this.noiDung,
      this.tgBatDau,
      this.tgKetThuc,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Baikiemtra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLopHocPhan = json['id_lop_hoc_phan'];
    idGiangVien = json['id_giang_vien'];
    idFile = json['id_file'];
    slCauHoi = json['sl_cau_hoi'];
    tieuDe = json['tieu_de'];
    noiDung = json['noi_dung'];
    tgBatDau = json['tg_bat_dau'];
    tgKetThuc = json['tg_ket_thuc'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_lop_hoc_phan'] = this.idLopHocPhan;
    data['id_giang_vien'] = this.idGiangVien;
    data['id_file'] = this.idFile;
    data['sl_cau_hoi'] = this.slCauHoi;
    data['tieu_de'] = this.tieuDe;
    data['noi_dung'] = this.noiDung;
    data['tg_bat_dau'] = this.tgBatDau;
    data['tg_ket_thuc'] = this.tgKetThuc;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Lop {
  int? id;
  int? idGiangvien;
  String? tenLop;
  String? nienKhoa;
  int? trangThai;
  Null? createdAt;
  Null? updatedAt;

  Lop(
      {this.id,
      this.idGiangvien,
      this.tenLop,
      this.nienKhoa,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Lop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idGiangvien = json['id_giangvien'];
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
    data['ten_lop'] = this.tenLop;
    data['nien_khoa'] = this.nienKhoa;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Baiviet {
  int? id;
  int? idLopHocPhan;
  int? idLoaiBaiViet;
  Null? idSinhVien;
  int? idGiangVien;
  String? noiDung;
  int? trangThai;
  String? createdAt;
  String? updatedAt;

  Baiviet(
      {this.id,
      this.idLopHocPhan,
      this.idLoaiBaiViet,
      this.idSinhVien,
      this.idGiangVien,
      this.noiDung,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

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
    return data;
  }
}
