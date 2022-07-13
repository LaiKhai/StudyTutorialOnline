class Subject {
  bool? status;
  OnlySubject? only_subject;

  Subject({this.status, this.only_subject});

  Subject.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    only_subject =
        json['bomon'] != null ? new OnlySubject.fromJson(json['bomon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.only_subject != null) {
      data['bomon'] = this.only_subject!.toJson();
    }
    return data;
  }
}

class OnlySubject {
  int? id;
  String? idKhoa;
  String? tenMonHoc;
  String? loaiMonHoc;
  String? trangThai;
  String? createdAt;
  String? updatedAt;
  String? tenKhoa;
  Khoa? khoa;

  OnlySubject(
      {this.id,
      this.idKhoa,
      this.tenMonHoc,
      this.loaiMonHoc,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.tenKhoa,
      this.khoa});

  OnlySubject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idKhoa = json['id_khoa'].toString();
    tenMonHoc = json['ten_mon_hoc'];
    loaiMonHoc = json['loai_mon_hoc'].toString();
    trangThai = json['trang_thai'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tenKhoa = json['ten_khoa'];
    khoa = json['khoa'] != null ? new Khoa.fromJson(json['khoa']) : null;
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
    if (this.khoa != null) {
      data['khoa'] = this.khoa!.toJson();
    }
    return data;
  }
}

class Khoa {
  int? id;
  String? tenKhoa;
  int? trangThai;
  Null? createdAt;
  Null? updatedAt;

  Khoa({this.id, this.tenKhoa, this.trangThai, this.createdAt, this.updatedAt});

  Khoa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenKhoa = json['ten_khoa'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten_khoa'] = this.tenKhoa;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
