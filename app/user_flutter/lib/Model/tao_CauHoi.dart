class Cauhoi_Ktra {
  List<ListCauHoi>? listCauHoi;

  Cauhoi_Ktra({this.listCauHoi});

  Cauhoi_Ktra.fromJson(Map<String, dynamic> json) {
    if (json['list_cau_hoi'] != null) {
      listCauHoi = <ListCauHoi>[];
      json['list_cau_hoi'].forEach((v) {
        listCauHoi!.add(new ListCauHoi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listCauHoi != null) {
      data['list_cau_hoi'] = this.listCauHoi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListCauHoi {
  int? idBaiKiemTra;
  String? deBai;
  String? dapAn1;
  String? dapAn2;
  String? dapAn3;
  String? dapAn4;
  String? dapAnDung;
  double? diem;
  int? trangThai;

  ListCauHoi(
      {this.idBaiKiemTra,
      this.deBai,
      this.dapAn1,
      this.dapAn2,
      this.dapAn3,
      this.dapAn4,
      this.dapAnDung,
      this.diem,
      this.trangThai});

  ListCauHoi.fromJson(Map<String, dynamic> json) {
    idBaiKiemTra = json['id_bai_kiem_tra'];
    deBai = json['de_bai'];
    dapAn1 = json['dap_an_1'];
    dapAn2 = json['dap_an_2'];
    dapAn3 = json['dap_an_3'];
    dapAn4 = json['dap_an_4'];
    dapAnDung = json['dap_an_dung'];
    diem = json['diem'];
    trangThai = json['trang_thai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_bai_kiem_tra'] = this.idBaiKiemTra;
    data['de_bai'] = this.deBai;
    data['dap_an_1'] = this.dapAn1;
    data['dap_an_2'] = this.dapAn2;
    data['dap_an_3'] = this.dapAn3;
    data['dap_an_4'] = this.dapAn4;
    data['dap_an_dung'] = this.dapAnDung;
    data['diem'] = this.diem;
    data['trang_thai'] = this.trangThai;
    return data;
  }
}
