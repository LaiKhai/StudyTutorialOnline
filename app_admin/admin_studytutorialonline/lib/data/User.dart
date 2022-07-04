class User {
  final int? id;
  final String khoa;
  final String email;
  final String password;
  final String avt;
  final String ho_ten;
  final String sdt;
  final String ngay_sinh;
  final String chuc_vu;
  final int trang_thai;
  final String token;

  User(this.id, this.khoa, this.email, this.password, this.avt, this.ho_ten,
      this.sdt, this.ngay_sinh, this.chuc_vu, this.trang_thai, this.token);

  User.fromJson(Map<String, dynamic> json)
      : id = json['user']['id'],
        khoa = json['user']['khoa']['ten_khoa'],
        email = json['user']['email'],
        password = json['user']['password'],
        avt = json['user']['avt'],
        ho_ten = json['user']['ho_ten'],
        sdt = json['user']['sdt'],
        ngay_sinh = json['user']['ngay_sinh'],
        chuc_vu = json['user']['chucvu']['ten_chuc_vu'],
        trang_thai = json['user']['trang_thai'],
        token = json['token'];
}
