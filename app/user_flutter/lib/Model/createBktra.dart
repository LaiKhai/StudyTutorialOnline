class Crate_Bktra {
  String? message;
  Baikiemtra? baikiemtra;

  Crate_Bktra({this.message, this.baikiemtra});

  Crate_Bktra.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    baikiemtra = json['baikiemtra'] != null
        ? new Baikiemtra.fromJson(json['baikiemtra'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.baikiemtra != null) {
      data['baikiemtra'] = this.baikiemtra!.toJson();
    }
    return data;
  }
}

class   Baikiemtra {
  int? id;
  int? idLopHocPhan;
  int? idGiangVien;
  String? idFile;
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
    if (json['id_file'] != null) {
      idFile = json['id_file'];
    } else {
      idFile = '';
    }

    slCauHoi = json['sl_cau_hoi'];
    tieuDe = json['tieu_de'];
    noiDung = json['noi_dung'];
    tgBatDau = json['tg_bat_dau'];
    if (json['tg_ket_thuc'] != null) {
      tgKetThuc = '';
    }
    tgKetThuc = json['tg_ket_thuc'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    if (json['updated_at'] != null) {
      updatedAt = json['updated_at'];
    } else {
      updatedAt = '';
    }
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
