class Student {
  final int id;
  final String id_lop;
  final String email;
  final String password;
  final String? avt;
  final String ma_so;
  final String sdt;
  final String ho_ten;
  final String ngay_sinh;
  final String trang_thai;
  final String ten_lop;
  final String nien_khoa;
  Student(
      this.id,
      this.id_lop,
      this.email,
      this.password,
      this.avt,
      this.ma_so,
      this.sdt,
      this.ho_ten,
      this.ngay_sinh,
      this.trang_thai,
      this.ten_lop,
      this.nien_khoa);

  Student.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        id_lop = json['id_lop'].toString(),
        email = json['email'],
        password = json['password'],
        avt = json['avt'],
        ma_so = json['ma_so'],
        sdt = json['sdt'],
        ho_ten = json['ho_ten'],
        ngay_sinh = json['ngay_sinh'],
        trang_thai = json['trang_thai'].toString(),
        ten_lop = json['ten_lop'],
        nien_khoa = json['nien_khoa'];
}
