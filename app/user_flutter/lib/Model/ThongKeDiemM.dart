class ThongKeDiem_M {
  bool? status;
  List<DataDiem>? data;
  List<DataBaiktra>? databaiktra;

  ThongKeDiem_M({this.status, this.data, this.databaiktra});

  ThongKeDiem_M.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataDiem>[];
      json['data'].forEach((v) {
        data!.add(new DataDiem.fromJson(v));
      });
    }
    if (json['databaiktra'] != null) {
      databaiktra = <DataBaiktra>[];
      json['databaiktra'].forEach((v) {
        databaiktra!.add(new DataBaiktra.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.databaiktra != null) {
      data['databaiktra'] = this.databaiktra!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataDiem {
  int? idBaiKiemTra;
  int? idSinhVien;
  String? tgNopBai;
  int? tongDiem;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  Sinhvien? sinhvien;

  DataDiem(
      {this.idBaiKiemTra,
      this.idSinhVien,
      this.tgNopBai,
      this.tongDiem,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.sinhvien});

  DataDiem.fromJson(Map<String, dynamic> json) {
    idBaiKiemTra = json['id_bai_kiem_tra'];
    idSinhVien = json['id_sinh_vien'];
    tgNopBai = json['tg_nop_bai'];
    tongDiem = json['tong_diem'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sinhvien = json['sinhvien'] != null
        ? new Sinhvien.fromJson(json['sinhvien'])
        : null;
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
    if (this.sinhvien != null) {
      data['sinhvien'] = this.sinhvien!.toJson();
    }
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

class DataBaiktra {
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

  DataBaiktra(
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
      this.updatedAt,
      this.idKhoa,
      this.idChucVu,
      this.idLop,
      this.email,
      this.password,
      this.avt,
      this.maSo,
      this.sdt,
      this.hoTen,
      this.ngaySinh});

  DataBaiktra.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
