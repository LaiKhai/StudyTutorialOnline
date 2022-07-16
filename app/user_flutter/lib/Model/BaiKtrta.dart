class Bai_Ktra_model {
  bool? status;
  Data? data;

  Bai_Ktra_model({this.status, this.data});

  Bai_Ktra_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? idBoMon;
  int? idLop;
  String? avt;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  List<Baikiemtra_model>? baikiemtra;

  Data(
      {this.id,
      this.idBoMon,
      this.idLop,
      this.avt,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.baikiemtra});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBoMon = json['id_bo_mon'];
    idLop = json['id_lop'];
    avt = json['avt'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['baikiemtra'] != null) {
      baikiemtra = <Baikiemtra_model>[];
      json['baikiemtra'].forEach((v) {
        baikiemtra!.add(new Baikiemtra_model.fromJson(v));
      });
    }
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
    if (this.baikiemtra != null) {
      data['baikiemtra'] = this.baikiemtra!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Baikiemtra_model {
  int? id;
  int? idLopHocPhan;
  int? idGiangVien;
  int? slCauHoi;
  String? tieuDe;
  String? noiDung;
  String? tgBatDau;
  String? tgKetThuc;
  int? trangThai;
  DateTime? createdAt;
  DateTime? updatedAt;

  Baikiemtra_model(
      {this.id,
      this.idLopHocPhan,
      this.idGiangVien,
      this.slCauHoi,
      this.tieuDe,
      this.noiDung,
      this.tgBatDau,
      this.tgKetThuc,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Baikiemtra_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLopHocPhan = json['id_lop_hoc_phan'];
    idGiangVien = json['id_giang_vien'];
    slCauHoi = json['sl_cau_hoi'];
    tieuDe = json['tieu_de'];
    noiDung = json['noi_dung'];
    tgBatDau = json['tg_bat_dau'];
    tgKetThuc = json['tg_ket_thuc'];
    trangThai = json['trang_thai'];
    createdAt = DateTime.parse(json['created_at']);
    if (updatedAt != null) {
      updatedAt = DateTime.parse(json['updated_at']);
    } else {
      updatedAt = DateTime.now();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_lop_hoc_phan'] = this.idLopHocPhan;
    data['id_giang_vien'] = this.idGiangVien;
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

class CT_Bai_Ktra_model {
  bool? status;
  CT_Baikiemtra? baikiemtra;

  CT_Bai_Ktra_model({this.status, this.baikiemtra});

  CT_Bai_Ktra_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    baikiemtra = json['baikiemtra'] != null
        ? new CT_Baikiemtra.fromJson(json['baikiemtra'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.baikiemtra != null) {
      data['baikiemtra'] = this.baikiemtra!.toJson();
    }
    return data;
  }
}

//model chi tiết bài ktra

class CT_Baikiemtra {
  int? id;
  int? idLopHocPhan;
  int? idGiangVien;
  int? slCauHoi;
  String? tieuDe;
  String? noiDung;
  String? tgBatDau;
  String? tgKetThuc;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  Lophocphan? lophocphan;
  Giangvien? giangvien;
  List<Cauhoi>? cauhoi;

  CT_Baikiemtra(
      {this.id,
      this.idLopHocPhan,
      this.idGiangVien,
      this.slCauHoi,
      this.tieuDe,
      this.noiDung,
      this.tgBatDau,
      this.tgKetThuc,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.lophocphan,
      this.giangvien,
      this.cauhoi});

  CT_Baikiemtra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLopHocPhan = json['id_lop_hoc_phan'];
    idGiangVien = json['id_giang_vien'];
    slCauHoi = json['sl_cau_hoi'];
    tieuDe = json['tieu_de'];
    noiDung = json['noi_dung'];
    if (json['tg_bat_dau'] == null) {
      tgBatDau = '';
    } else {
      tgBatDau = json['tg_bat_dau'];
    }
    if (json['tg_ket_thuc'] == null) {
      tgKetThuc = '';
    } else {
      tgKetThuc = json['tg_ket_thuc'];
    }

    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lophocphan = json['lophocphan'] != null
        ? new Lophocphan.fromJson(json['lophocphan'])
        : null;
    giangvien = json['giangvien'] != null
        ? new Giangvien.fromJson(json['giangvien'])
        : null;

    if (json['cauhoi'] != null) {
      cauhoi = <Cauhoi>[];
      json['cauhoi'].forEach((v) {
        cauhoi!.add(new Cauhoi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_lop_hoc_phan'] = this.idLopHocPhan;
    data['id_giang_vien'] = this.idGiangVien;
    data['sl_cau_hoi'] = this.slCauHoi;
    data['tieu_de'] = this.tieuDe;
    data['noi_dung'] = this.noiDung;
    data['tg_bat_dau'] = this.tgBatDau;
    data['tg_ket_thuc'] = this.tgKetThuc;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.lophocphan != null) {
      data['lophocphan'] = this.lophocphan!.toJson();
    }
    if (this.giangvien != null) {
      data['giangvien'] = this.giangvien!.toJson();
    }
    if (this.cauhoi != null) {
      data['cauhoi'] = this.cauhoi!.map((v) => v.toJson()).toList();
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

class Giangvien {
  int? id;
  int? idKhoa;
  int? idChucVu;
  String? email;
  String? password;
  String? maSo;
  String? sdt;
  String? hoTen;
  String? ngaySinh;
  int? trangThai;

  Giangvien({
    this.id,
    this.idKhoa,
    this.idChucVu,
    this.email,
    this.password,
    this.maSo,
    this.sdt,
    this.hoTen,
    this.ngaySinh,
    this.trangThai,
  });

  Giangvien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKhoa = json['id_khoa'];
    idChucVu = json['id_chuc_vu'];

    email = json['email'];
    password = json['password'];

    maSo = json['ma_so'];
    sdt = json['sdt'];
    hoTen = json['ho_ten'];
    ngaySinh = json['ngay_sinh'];
    trangThai = json['trang_thai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_khoa'] = this.idKhoa;
    data['id_chuc_vu'] = this.idChucVu;
    data['email'] = this.email;
    data['password'] = this.password;
    data['ma_so'] = this.maSo;
    data['sdt'] = this.sdt;
    data['ho_ten'] = this.hoTen;
    data['ngay_sinh'] = this.ngaySinh;
    data['trang_thai'] = this.trangThai;
    return data;
  }
}

class Cauhoi {
  int? id;
  int? idBaiKiemTra;
  String? deBai;
  String? dapAn1;
  String? dapAn2;
  String? dapAn3;
  String? dapAn4;
  String? dapAnDung;
  int? diem;
  int? trangThai;
  String? createdAt;
  String? updatedAt;

  Cauhoi(
      {this.id,
      this.idBaiKiemTra,
      this.deBai,
      this.dapAn1,
      this.dapAn2,
      this.dapAn3,
      this.dapAn4,
      this.dapAnDung,
      this.diem,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Cauhoi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBaiKiemTra = json['id_bai_kiem_tra'];
    deBai = json['de_bai'];
    dapAn1 = json['dap_an_1'];
    dapAn2 = json['dap_an_2'];
    dapAn3 = json['dap_an_3'];
    dapAn4 = json['dap_an_4'];
    dapAnDung = json['dap_an_dung'];
    diem = json['diem'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_bai_kiem_tra'] = this.idBaiKiemTra;
    data['de_bai'] = this.deBai;
    data['dap_an_1'] = this.dapAn1;
    data['dap_an_2'] = this.dapAn2;
    data['dap_an_3'] = this.dapAn3;
    data['dap_an_4'] = this.dapAn4;
    data['dap_an_dung'] = this.dapAnDung;
    data['diem'] = this.diem;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
