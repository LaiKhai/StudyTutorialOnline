class Positions {
  bool? status;
  List<Chucvu>? chucvu;

  Positions({this.status, this.chucvu});

  Positions.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['chucvu'] != null) {
      chucvu = <Chucvu>[];
      json['chucvu'].forEach((v) {
        chucvu!.add(new Chucvu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.chucvu != null) {
      data['chucvu'] = this.chucvu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chucvu {
  int? id;
  String? tenChucVu;
  int? trangThai;
  Null? createdAt;
  Null? updatedAt;

  Chucvu(
      {this.id,
      this.tenChucVu,
      this.trangThai,
      this.createdAt,
      this.updatedAt});

  Chucvu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenChucVu = json['ten_chuc_vu'];
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten_chuc_vu'] = this.tenChucVu;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
