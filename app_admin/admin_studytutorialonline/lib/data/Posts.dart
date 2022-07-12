class Posts {
  bool? status;
  List<Baiviet>? baiviet;

  Posts({this.status, this.baiviet});

  Posts.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['baiviet'] != null) {
      baiviet = <Baiviet>[];
      json['baiviet'].forEach((v) {
        baiviet!.add(new Baiviet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.baiviet != null) {
      data['baiviet'] = this.baiviet!.map((v) => v.toJson()).toList();
    }
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
  Lophocphan? lophocphan;
  Loaibaiviet? loaibaiviet;
  List<Checkfile>? checkfile;
  List<Files>? files;
  Sinhvien? sinhvien;
  Giangvien? giangvien;

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
      this.checkfile,
      this.files,
      this.sinhvien,
      this.giangvien});

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
    if (json['checkfile'] != null) {
      checkfile = <Checkfile>[];
      json['checkfile'].forEach((v) {
        checkfile!.add(new Checkfile.fromJson(v));
      });
    }
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(new Files.fromJson(v));
      });
    }
    sinhvien = json['sinhvien'] != null
        ? new Sinhvien.fromJson(json['sinhvien'])
        : null;
    giangvien = json['giangvien'] != null
        ? new Giangvien.fromJson(json['giangvien'])
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
    if (this.checkfile != null) {
      data['checkfile'] = this.checkfile!.map((v) => v.toJson()).toList();
    }
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    if (this.sinhvien != null) {
      data['sinhvien'] = this.sinhvien!.toJson();
    }
    if (this.giangvien != null) {
      data['giangvien'] = this.giangvien!.toJson();
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

class Checkfile {
  int? idBaiViet;
  int? idFile;
  int? trangThai;
  String? createdAt;
  String? updatedAt;

  Checkfile(
      {this.idBaiViet,
      this.idFile,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Checkfile.fromJson(Map<String, dynamic> json) {
    idBaiViet = json['id_bai_viet'];
    idFile = json['id_file'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_bai_viet'] = this.idBaiViet;
    data['id_file'] = this.idFile;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Files {
  int? id;
  String? noiDung;
  String? tenFile;
  String? loaiFile;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Files(
      {this.id,
      this.noiDung,
      this.tenFile,
      this.loaiFile,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Files.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noiDung = json['noi_dung'];
    tenFile = json['ten_file'];
    loaiFile = json['loai_file'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? idBaiViet;
  int? idFile;

  Pivot({this.idBaiViet, this.idFile});

  Pivot.fromJson(Map<String, dynamic> json) {
    idBaiViet = json['id_bai_viet'];
    idFile = json['id_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_bai_viet'] = this.idBaiViet;
    data['id_file'] = this.idFile;
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
  Null? avt;
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

class Giangvien {
  int? id;
  int? idKhoa;
  int? idChucVu;
  Null? idLop;
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

  Giangvien(
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

  Giangvien.fromJson(Map<String, dynamic> json) {
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
