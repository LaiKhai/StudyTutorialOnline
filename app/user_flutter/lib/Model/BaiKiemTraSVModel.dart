class BaiKtraSVModel {
  bool? status;
  List<Data>? data;

  BaiKtraSVModel({this.status, this.data});

  BaiKtraSVModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? hoTen;
  int? idBaiKiemTra;
  int? idSinhVien;
  String? tgNopBai;
  int? tongDiem;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  int? id;
  int? idBoMon;
  int? idLop;
  String? avt;
  int? slCauHoi;
  String? tieuDe;
  String? noiDung;
  String? tgBatDau;
  String? tgKetThuc;

  Data(
      {this.hoTen,
      this.idBaiKiemTra,
      this.idSinhVien,
      this.tgNopBai,
      this.tongDiem,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.id,
      this.idBoMon,
      this.idLop,
      this.avt,
      this.slCauHoi,
      this.tieuDe,
      this.noiDung,
      this.tgBatDau,
      this.tgKetThuc});

  Data.fromJson(Map<String, dynamic> json) {
    hoTen = json['ho_ten'];
    idBaiKiemTra = json['id_bai_kiem_tra'];
    idSinhVien = json['id_sinh_vien'];
    tgNopBai = json['tg_nop_bai'];
    tongDiem = json['tong_diem'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
    idBoMon = json['id_bo_mon'];
    idLop = json['id_lop'];
    avt = json['avt'];
    slCauHoi = json['sl_cau_hoi'];
    tieuDe = json['tieu_de'];
    noiDung = json['noi_dung'];
    tgBatDau = json['tg_bat_dau'];
    tgKetThuc = json['tg_ket_thuc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ho_ten'] = this.hoTen;
    data['id_bai_kiem_tra'] = this.idBaiKiemTra;
    data['id_sinh_vien'] = this.idSinhVien;
    data['tg_nop_bai'] = this.tgNopBai;
    data['tong_diem'] = this.tongDiem;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    data['id_bo_mon'] = this.idBoMon;
    data['id_lop'] = this.idLop;
    data['avt'] = this.avt;
    data['sl_cau_hoi'] = this.slCauHoi;
    data['tieu_de'] = this.tieuDe;
    data['noi_dung'] = this.noiDung;
    data['tg_bat_dau'] = this.tgBatDau;
    data['tg_ket_thuc'] = this.tgKetThuc;
    return data;
  }
}
