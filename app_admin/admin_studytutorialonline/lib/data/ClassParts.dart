class ClassParts {
  List<Lophocphan>? lophocphan;

  ClassParts({this.lophocphan});

  ClassParts.fromJson(Map<String, dynamic> json) {
    if (json['lophocphan'] != null) {
      lophocphan = <Lophocphan>[];
      json['lophocphan'].forEach((v) {
        lophocphan!.add(new Lophocphan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lophocphan != null) {
      data['lophocphan'] = this.lophocphan!.map((v) => v.toJson()).toList();
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
  int? idKhoa;
  String? tenMonHoc;
  int? loaiMonHoc;
  String? tenKhoa;
  String? tenLop;

  Lophocphan(
      {this.id,
      this.idBoMon,
      this.idLop,
      this.avt,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.idKhoa,
      this.tenMonHoc,
      this.loaiMonHoc,
      this.tenKhoa,
      this.tenLop});

  Lophocphan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBoMon = json['id_bo_mon'];
    idLop = json['id_lop'];
    avt = json['avt'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    idKhoa = json['id_khoa'];
    tenMonHoc = json['ten_mon_hoc'];
    loaiMonHoc = json['loai_mon_hoc'];
    tenKhoa = json['ten_khoa'];
    tenLop = json['ten_lop'];
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
    data['id_khoa'] = this.idKhoa;
    data['ten_mon_hoc'] = this.tenMonHoc;
    data['loai_mon_hoc'] = this.loaiMonHoc;
    data['ten_khoa'] = this.tenKhoa;
    data['ten_lop'] = this.tenLop;
    return data;
  }
}
