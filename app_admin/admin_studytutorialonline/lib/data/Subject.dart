class Subject {
  final int id;
  final String id_khoa;
  final String ten_mon_hoc;
  final String loai_mon_hoc;
  final String ten_khoa;
  final String trang_thai;
  Subject(this.id, this.id_khoa, this.ten_mon_hoc, this.loai_mon_hoc,
      this.ten_khoa, this.trang_thai);

  Subject.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        id_khoa = json['id_khoa'].toString(),
        ten_mon_hoc = json['ten_mon_hoc'],
        loai_mon_hoc = json['loai_mon_hoc'].toString(),
        ten_khoa = json['khoa']['ten_khoa'],
        trang_thai = json['trang_thai'].toString();
}
