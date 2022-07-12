class Department {
  final int id;
  final String tenkhoa;
  final String trangthai;

  Department(this.id, this.tenkhoa, this.trangthai);

  Department.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        tenkhoa = json['ten_khoa'],
        trangthai = json['trang_thai'].toString();
}
