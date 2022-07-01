class User {
  final int? id;
  final String khoa;
  final String email;
  final String password;
  final String avt;
  final String ho_ten;
  final String sdt;
  final DateTime ngay_sinh;
  final String chuc_vu;
  final String trang_thai;
  final String token;

  User(this.id, this.khoa, this.email, this.password, this.avt, this.ho_ten,
      this.sdt, this.ngay_sinh, this.chuc_vu, this.trang_thai, this.token);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        khoa = json['khoa']['ten_khoa'],
        email = json['email'],
        password = json['password'],
        avt = json['avt'],
        ho_ten = json['ho_ten'],
        sdt = json['sdt'],
        ngay_sinh = json['ngay_sinh'],
        chuc_vu = json['chucvu']['ten_chuc_vu'],
        trang_thai = json['trang_thai'],
        token = json['token'];
}
