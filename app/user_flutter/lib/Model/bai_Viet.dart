class baiViets {
  List<Baiviet>? baiviet;

  baiViets({this.baiviet});

  baiViets.fromJson(Map<String, dynamic> json) {
    if (json['baiviet'] != null) {
      baiviet = <Baiviet>[];
      json['baiviet'].forEach((v) {
        baiviet!.add(new Baiviet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  DateTime? createdAt;
  DateTime? updatedAt;
  Lophocphan? lophocphan;
  Loaibaiviet? loaibaiviet;
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
      this.sinhvien,
      this.giangvien});

  Baiviet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLopHocPhan = json['id_lop_hoc_phan'];
    idLoaiBaiViet = json['id_loai_bai_viet'];
    if (json['id_sinh_vien'] == null) {
      idSinhVien = 0;
    } else {
      idSinhVien = json['id_sinh_vien'];
    }

    if (json['id_giang_vien'] == null) {
      idGiangVien = 0;
    } else {
      idGiangVien = json['id_giang_vien'];
    }
    noiDung = json['noi_dung'];
    trangThai = json['trang_thai'];

    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    lophocphan = json['lophocphan'] != null
        ? new Lophocphan.fromJson(json['lophocphan'])
        : null;
    loaibaiviet = json['loaibaiviet'] != null
        ? new Loaibaiviet.fromJson(json['loaibaiviet'])
        : null;
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

class Sinhvien {
  int? id;
  int? idKhoa;
  int? idChucVu;
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
    if (json['id_khoa'] == null) {
      idKhoa = 0;
    } else
      idKhoa = json['id_khoa'];
    if (json['id_chuc_vu'] == null) {
      idChucVu = 0;
    } else
      idChucVu = json['id_chuc_vu'];
    if (json['id_lop'] == null) {
      idLop = 0;
    } else {
      idLop = json['id_lop'];
    }
    email = json['email'];
    password = json['password'];
    if (json['avt'] == null) {
      avt = '/assets/images/no_image.png';
    } else
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
    if (json['id_lop'] == null) {
      idLop = 0;
    } else
      idLop = json['id_lop'];
    email = json['email'];
    password = json['password'];
    if (json['avt'] == null) {
      avt = '/assets/images/no_image.png';
    } else
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
