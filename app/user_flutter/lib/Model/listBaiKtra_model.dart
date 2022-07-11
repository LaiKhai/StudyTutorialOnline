class List_Ktra_model {
  bool? status;
  List<BaiKtra_model>? data;

  List_Ktra_model({this.status, this.data});

  List_Ktra_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <BaiKtra_model>[];
      json['data'].forEach((v) {
        data!.add(new BaiKtra_model.fromJson(v));
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

class BaiKtra_model {
  int? id;
  int? idBoMon;
  int? idLop;
  String? avt;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  int? idLopHocPhan;
  int? idGiangVien;
  int? slCauHoi;
  String? tieuDe;
  String? noiDung;
  String? tgBatDau;
  String? tgKetThuc;

  BaiKtra_model(
      {this.id,
      this.idBoMon,
      this.idLop,
      this.avt,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.idLopHocPhan,
      this.idGiangVien,
      this.slCauHoi,
      this.tieuDe,
      this.noiDung,
      this.tgBatDau,
      this.tgKetThuc});

  BaiKtra_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBoMon = json['id_bo_mon'];
    idLop = json['id_lop'];
    avt = json['avt'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    idLopHocPhan = json['id_lop_hoc_phan'];
    idGiangVien = json['id_giang_vien'];
    slCauHoi = json['sl_cau_hoi'];
    tieuDe = json['tieu_de'];
    noiDung = json['noi_dung'];
    tgBatDau = json['tg_bat_dau'];
    tgKetThuc = json['tg_ket_thuc'];
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
    data['id_lop_hoc_phan'] = this.idLopHocPhan;
    data['id_giang_vien'] = this.idGiangVien;
    data['sl_cau_hoi'] = this.slCauHoi;
    data['tieu_de'] = this.tieuDe;
    data['noi_dung'] = this.noiDung;
    data['tg_bat_dau'] = this.tgBatDau;
    data['tg_ket_thuc'] = this.tgKetThuc;
    return data;
  }
}
