class Ctiet_lopHP {
  Lophocphan? lophocphan;
  List<Dssv>? dssv;
  List<Dsgv>? dsgv;

  Ctiet_lopHP({this.lophocphan, this.dssv, this.dsgv});

  Ctiet_lopHP.fromJson(Map<String, dynamic> json) {
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
  int? idBoMon;
  int? idLop;
  String? avt;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  Lop? lop;
  Bomon? bomon;
  List<Baiviet>? baiviet;

  Lophocphan(
      {this.id,
      this.idBoMon,
      this.idLop,
      this.avt,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.lop,
      this.bomon});

  Lophocphan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBoMon = json['id_bo_mon'];
    idLop = json['id_lop'];
    avt = json['avt'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lop = json['lop'] != null ? new Lop.fromJson(json['lop']) : null;
    if (json['baiviet'] != null) {
      baiviet = <Baiviet>[];
      json['baiviet'].forEach((v) {
        baiviet!.add(new Baiviet.fromJson(v));
      });
    }
    bomon = json['bomon'] != null ? new Bomon.fromJson(json['bomon']) : null;
    if (json['baitap'] != null) {}
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
  String? avt;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  int? idSinhVien;
  int? idLopHocPhan;
  int? idKhoa;
  int? idChucVu;
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
      this.idSinhVien,
      this.idLopHocPhan,
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
    idSinhVien = json['id_sinh_vien'];
    idLopHocPhan = json['id_lop_hoc_phan'];
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
    data['id_sinh_vien'] = this.idSinhVien;
    data['id_lop_hoc_phan'] = this.idLopHocPhan;
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

class Baiviet {
  int? id;
  int? idLopHocPhan;
  int? idLoaiBaiViet;
  int? idSinhVien;
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

class Dsgv {
  int? id;
  int? idBoMon;
  int? idLop;
  String? avt;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  int? idGiangVien;
  int? idLopHocPhan;
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
      this.idGiangVien,
      this.idLopHocPhan,
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
    idGiangVien = json['id_giang_vien'];
    idLopHocPhan = json['id_lop_hoc_phan'];
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
    data['id_giang_vien'] = this.idGiangVien;
    data['id_lop_hoc_phan'] = this.idLopHocPhan;
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
