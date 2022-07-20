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

class CT_Baikiemtra {
  int? id;
  int? idLopHocPhan;
  int? idGiangVien;
  int? slCauHoi;
  String? tieuDe;
  String? noiDung;
  String? tgBatDau;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  Lophocphan? lophocphan;
  Giangvien? giangvien;
  List<Ctbaikiemtra>? ctbaikiemtra;
  List<Cauhoi>? cauhoi;

  CT_Baikiemtra(
      {this.id,
      this.idLopHocPhan,
      this.idGiangVien,
      this.slCauHoi,
      this.tieuDe,
      this.noiDung,
      this.tgBatDau,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.lophocphan,
      this.giangvien,
      this.ctbaikiemtra,
      this.cauhoi});

  CT_Baikiemtra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLopHocPhan = json['id_lop_hoc_phan'];
    idGiangVien = json['id_giang_vien'];
    slCauHoi = json['sl_cau_hoi'];
    tieuDe = json['tieu_de'];
    noiDung = json['noi_dung'];
    tgBatDau = json['tg_bat_dau'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lophocphan = json['lophocphan'] != null
        ? new Lophocphan.fromJson(json['lophocphan'])
        : null;
    giangvien = json['giangvien'] != null
        ? new Giangvien.fromJson(json['giangvien'])
        : null;
    if (json['ctbaikiemtra'] != null) {
      ctbaikiemtra = <Ctbaikiemtra>[];
      json['ctbaikiemtra'].forEach((v) {
        ctbaikiemtra!.add(new Ctbaikiemtra.fromJson(v));
      });
    }
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
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.lophocphan != null) {
      data['lophocphan'] = this.lophocphan!.toJson();
    }
    if (this.giangvien != null) {
      data['giangvien'] = this.giangvien!.toJson();
    }
    if (this.ctbaikiemtra != null) {
      data['ctbaikiemtra'] = this.ctbaikiemtra!.map((v) => v.toJson()).toList();
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

class Ctbaikiemtra {
  int? idBaiKiemTra;
  int? idSinhVien;
  String? tgNopBai;
  int? tongDiem;
  int? trangThai;
  String? createdAt;
  String? updatedAt;

  Ctbaikiemtra(
      {this.idBaiKiemTra,
      this.idSinhVien,
      this.tgNopBai,
      this.tongDiem,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Ctbaikiemtra.fromJson(Map<String, dynamic> json) {
    idBaiKiemTra = json['id_bai_kiem_tra'];
    idSinhVien = json['id_sinh_vien'];
    tgNopBai = json['tg_nop_bai'];
    tongDiem = json['tong_diem'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_bai_kiem_tra'] = this.idBaiKiemTra;
    data['id_sinh_vien'] = this.idSinhVien;
    data['tg_nop_bai'] = this.tgNopBai;
    data['tong_diem'] = this.tongDiem;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Cauhoi {
  int? id;
  int? idBaiKiemTra;
  Null? idFile;
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
      this.idFile,
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
    idFile = json['id_file'];
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
    data['id_file'] = this.idFile;
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
