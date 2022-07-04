class ClassRoom {
  final int id;
  final String tenlop;
  final String nienkhoa;
  final String giangvien;
  final int trang_thai;
  ClassRoom(
      this.id, this.tenlop, this.nienkhoa, this.giangvien, this.trang_thai);

  ClassRoom.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        tenlop = json['ten_lop'],
        nienkhoa = json['nien_khoa'],
        giangvien = json['giangvien']['ho_ten'],
        trang_thai = json['trang_thai'];
}
