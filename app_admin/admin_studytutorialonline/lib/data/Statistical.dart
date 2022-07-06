class Statistical {
  final int sinhvien;
  final int giangvien;
  final int lop;
  Statistical(this.sinhvien, this.giangvien, this.lop);
  Statistical.fromJson(Map<String, dynamic> json)
      : sinhvien = json['sinhvien'],
        giangvien = json['giangvien'],
        lop = json['lop'];
}
