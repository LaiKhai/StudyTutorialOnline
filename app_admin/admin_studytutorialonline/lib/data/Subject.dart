class Subject {
  final int id;
  final String ten_mon_hoc;
  final String loai_mon_hoc;
  final String ten_khoa;
  final int trang_thai;
  Subject(this.id, this.ten_mon_hoc, this.loai_mon_hoc, this.ten_khoa,
      this.trang_thai);

  Subject.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        ten_mon_hoc = json['ten_mon_hoc'],
        loai_mon_hoc = json['loai_mon_hoc'].toString(),
        ten_khoa = json['ten_khoa'],
        trang_thai = json['trang_thai'];
}
