class ttSvienKtra_M {
  bool? status;
  List<SinhvienKtra>? sinhvien;

  ttSvienKtra_M({this.status, this.sinhvien});

  ttSvienKtra_M.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sinhvien'] != null) {
      sinhvien = <SinhvienKtra>[];
      json['sinhvien'].forEach((v) {
        sinhvien!.add(new SinhvienKtra.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.sinhvien != null) {
      data['sinhvien'] = this.sinhvien!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SinhvienKtra {
  int? idsinhvien;
  String? hoTen;
  String? maSo;
  String? email;
  int? idlop;
  String? tenLop;
  int? tongdiem;
  int? trangThai;
  String? tgNopBai;

  SinhvienKtra(
      {this.idsinhvien,
      this.hoTen,
      this.maSo,
      this.email,
      this.idlop,
      this.tenLop,
      this.tongdiem,
      this.trangThai,
      this.tgNopBai});

  SinhvienKtra.fromJson(Map<String, dynamic> json) {
    idsinhvien = json['idsinhvien'];
    hoTen = json['ho_ten'];
    maSo = json['ma_so'];
    email = json['email'];
    idlop = json['idlop'];
    tenLop = json['ten_lop'];
    tongdiem = json['tongdiem'];
    trangThai = json['trang_thai'];
    tgNopBai = json['tg_nop_bai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idsinhvien'] = this.idsinhvien;
    data['ho_ten'] = this.hoTen;
    data['ma_so'] = this.maSo;
    data['email'] = this.email;
    data['idlop'] = this.idlop;
    data['ten_lop'] = this.tenLop;
    data['tongdiem'] = this.tongdiem;
    data['trang_thai'] = this.trangThai;
    data['tg_nop_bai'] = this.tgNopBai;
    return data;
  }
}
