import 'dart:ffi';

class BaiTapModel {
  final int id;
  final String tieuDe;
  final String noiDung;
  final String createAt;
  final double diem;
  final int type;
  const BaiTapModel(
      {required this.id,
      required this.tieuDe,
      required this.noiDung,
      required this.createAt,
      required this.diem,
      required this.type});
}
