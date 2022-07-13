class Subjects {
  List<BoMon>? bomon;

  Subjects({this.bomon});

  Subjects.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      bomon = <BoMon>[];
      json['data'].forEach((v) {
        bomon!.add(new BoMon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bomon != null) {
      data['data'] = this.bomon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BoMon {
  int? id;
  int? idKhoa;
  String? tenMonHoc;
  int? loaiMonHoc;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  String? tenKhoa;

  BoMon(
      {this.id,
      this.idKhoa,
      this.tenMonHoc,
      this.loaiMonHoc,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.tenKhoa});

  BoMon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKhoa = json['id_khoa'];
    tenMonHoc = json['ten_mon_hoc'];
    loaiMonHoc = json['loai_mon_hoc'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tenKhoa = json['ten_khoa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_khoa'] = this.idKhoa;
    data['ten_mon_hoc'] = this.tenMonHoc;
    data['loai_mon_hoc'] = this.loaiMonHoc;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['ten_khoa'] = this.tenKhoa;
    return data;
  }
}
