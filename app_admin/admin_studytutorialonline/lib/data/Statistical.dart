class Statistical {
  final String sinhvien;
  final String giangvien;
  final String lop;
  Statistical(this.sinhvien, this.giangvien, this.lop);
  Statistical.fromJson(Map<String, dynamic> json)
      : sinhvien = json['data']['sinhvien'],
        giangvien = json['data']['giangvien'],
        lop = json['data']['lop'];
}
