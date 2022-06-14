class SinhVien {
  final int id;
  final String? id_lop;
  final String? email;
  final String? password;
  final String? ho_ten;
  final String? avt;
  final String? mssv;
  final String? sdt;
  final String? ngay_sinh;
  final int trangthai;
  final String token;

  const SinhVien(
      {required this.id,
      required this.id_lop,
      required this.email,
      required this.password,
      required this.ho_ten,
      required this.avt,
      required this.mssv,
      required this.ngay_sinh,
      required this.sdt,
      required this.trangthai,
      required this.token});
  factory SinhVien.fromJson(Map<String, dynamic> json) {
    return SinhVien(
        id: json['sinhvien']['id'],
        id_lop: json['sinhvien']['id_lop'],
        email: json['sinhvien']['email'],
        password: json['sinhvien']['password'],
        ho_ten: json['sinhvien']['ho_ten'],
        avt: json['sinhvien']['avt'],
        mssv: json['sinhvien']['mssv'],
        ngay_sinh: json['sinhvien']['ngay_sinh'],
        sdt: json['sinhvien']['sdt'],
        trangthai: json['sinhvien']['trang_thai'],
        token: json['token']);
  }
}
