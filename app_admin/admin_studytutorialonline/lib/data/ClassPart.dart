class ClassPart {
  bool? status;
  Lophocphan? lophocphan;
  List<Dssv>? dssv;
  List<Dsgv>? dsgv;

  ClassPart({this.status, this.lophocphan, this.dssv, this.dsgv});

  ClassPart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    lophocphan = json['lophocphan'] != null
        ? new Lophocphan.fromJson(json['lophocphan'])
        : null;
    if (json['dssv'] != null) {
      dssv = <Dssv>[];
      json['dssv'].forEach((v) {
        dssv!.add(new Dssv.fromJson(v));
      });
    }
    if (json['dsgv'] != null) {
      dsgv = <Dsgv>[];
      json['dsgv'].forEach((v) {
        dsgv!.add(new Dsgv.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.lophocphan != null) {
      data['lophocphan'] = this.lophocphan!.toJson();
    }
    if (this.dssv != null) {
      data['dssv'] = this.dssv!.map((v) => v.toJson()).toList();
    }
    if (this.dsgv != null) {
      data['dsgv'] = this.dsgv!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lophocphan {
  int? id;
  String? idBoMon;
  String? idLop;
  String? avt;
  String? trangThai;
  String? createdAt;
  String? updatedAt;
  Lop? lop;
  List<Baikiemtra>? baikiemtra;
  Bomon? bomon;

  Lophocphan({
    this.id,
    this.idBoMon,
    this.idLop,
    this.avt,
    this.trangThai,
    this.createdAt,
    this.updatedAt,
    this.lop,
    this.baikiemtra,
    this.bomon,
  });

  Lophocphan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBoMon = json['id_bo_mon'].toString();
    idLop = json['id_lop'].toString();
    avt = json['avt'];
    trangThai = json['trang_thai'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lop = json['lop'] != null ? new Lop.fromJson(json['lop']) : null;
    if (json['baikiemtra'] != null) {
      baikiemtra = <Baikiemtra>[];
      json['baikiemtra'].forEach((v) {
        baikiemtra!.add(new Baikiemtra.fromJson(v));
      });
    }
    bomon = json['bomon'] != null ? new Bomon.fromJson(json['bomon']) : null;
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
    if (this.lop != null) {
      data['lop'] = this.lop!.toJson();
    }
    if (this.baikiemtra != null) {
      data['baikiemtra'] = this.baikiemtra!.map((v) => v.toJson()).toList();
    }
    if (this.bomon != null) {
      data['bomon'] = this.bomon!.toJson();
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
  String? createdAt;
  String? updatedAt;

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

class Bomon {
  int? id;
  int? idKhoa;
  String? tenMonHoc;
  int? loaiMonHoc;
  int? trangThai;
  String? createdAt;
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

class Dssv {
  int? id;
  int? idBoMon;
  int? idLop;
  Null? avt;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  Null? idKhoa;
  Null? idChucVu;
  String? email;
  String? password;
  String? maSo;
  String? sdt;
  String? hoTen;
  String? ngaySinh;

  Dssv(
      {this.id,
      this.idBoMon,
      this.idLop,
      this.avt,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.idKhoa,
      this.idChucVu,
      this.email,
      this.password,
      this.maSo,
      this.sdt,
      this.hoTen,
      this.ngaySinh});

  Dssv.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBoMon = json['id_bo_mon'];
    idLop = json['id_lop'];
    avt = json['avt'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    idKhoa = json['id_khoa'];
    idChucVu = json['id_chuc_vu'];
    email = json['email'];
    password = json['password'];
    maSo = json['ma_so'];
    sdt = json['sdt'];
    hoTen = json['ho_ten'];
    ngaySinh = json['ngay_sinh'];
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
    data['id_khoa'] = this.idKhoa;
    data['id_chuc_vu'] = this.idChucVu;
    data['email'] = this.email;
    data['password'] = this.password;
    data['ma_so'] = this.maSo;
    data['sdt'] = this.sdt;
    data['ho_ten'] = this.hoTen;
    data['ngay_sinh'] = this.ngaySinh;
    return data;
  }
}

class Dsgv {
  int? id;
  int? idBoMon;
  Null? idLop;
  Null? avt;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  int? idKhoa;
  int? idChucVu;
  String? email;
  String? password;
  String? maSo;
  String? sdt;
  String? hoTen;
  String? ngaySinh;

  Dsgv(
      {this.id,
      this.idBoMon,
      this.idLop,
      this.avt,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.idKhoa,
      this.idChucVu,
      this.email,
      this.password,
      this.maSo,
      this.sdt,
      this.hoTen,
      this.ngaySinh});

  Dsgv.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBoMon = json['id_bo_mon'];
    idLop = json['id_lop'];
    avt = json['avt'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    idKhoa = json['id_khoa'];
    idChucVu = json['id_chuc_vu'];
    email = json['email'];
    password = json['password'];
    maSo = json['ma_so'];
    sdt = json['sdt'];
    hoTen = json['ho_ten'];
    ngaySinh = json['ngay_sinh'];
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
    data['id_khoa'] = this.idKhoa;
    data['id_chuc_vu'] = this.idChucVu;
    data['email'] = this.email;
    data['password'] = this.password;
    data['ma_so'] = this.maSo;
    data['sdt'] = this.sdt;
    data['ho_ten'] = this.hoTen;
    data['ngay_sinh'] = this.ngaySinh;
    return data;
  }
}
