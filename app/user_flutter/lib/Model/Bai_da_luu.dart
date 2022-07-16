class BaiDaLuuModel {
  bool? status;
  List<BaikiemtraDL>? baikiemtra;

  BaiDaLuuModel({this.status, this.baikiemtra});

  BaiDaLuuModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['baikiemtra'] != null) {
      baikiemtra = <BaikiemtraDL>[];
      json['baikiemtra'].forEach((v) {
        baikiemtra!.add(new BaikiemtraDL.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.baikiemtra != null) {
      data['baikiemtra'] = this.baikiemtra!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BaikiemtraDL {
  int? id;
  String? dapAn;
  int? diem;
  int? trangThai;
  int? idBaiKiemTra;
  Null? idFile;
  String? deBai;
  String? dapAn1;
  String? dapAn2;
  String? dapAn3;
  String? dapAn4;
  String? dapAnDung;
  String? createdAt;
  String? updatedAt;

  BaikiemtraDL(
      {this.id,
      this.dapAn,
      this.diem,
      this.trangThai,
      this.idBaiKiemTra,
      this.idFile,
      this.deBai,
      this.dapAn1,
      this.dapAn2,
      this.dapAn3,
      this.dapAn4,
      this.dapAnDung,
      this.createdAt,
      this.updatedAt});

  BaikiemtraDL.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dapAn = json['dap_an'];
    diem = json['diem'];
    trangThai = json['trang_thai'];
    idBaiKiemTra = json['id_bai_kiem_tra'];
    idFile = json['id_file'];
    deBai = json['de_bai'];
    dapAn1 = json['dap_an_1'];
    dapAn2 = json['dap_an_2'];
    dapAn3 = json['dap_an_3'];
    dapAn4 = json['dap_an_4'];
    dapAnDung = json['dap_an_dung'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dap_an'] = this.dapAn;
    data['diem'] = this.diem;
    data['trang_thai'] = this.trangThai;
    data['id_bai_kiem_tra'] = this.idBaiKiemTra;
    data['id_file'] = this.idFile;
    data['de_bai'] = this.deBai;
    data['dap_an_1'] = this.dapAn1;
    data['dap_an_2'] = this.dapAn2;
    data['dap_an_3'] = this.dapAn3;
    data['dap_an_4'] = this.dapAn4;
    data['dap_an_dung'] = this.dapAnDung;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
