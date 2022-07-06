// import 'package:user_flutter/View/common/constant/string.dart';

// class baiViets {
//   bool? status;
//   List<BaiViet_model>? list_baiviet;

//   baiViets({this.status, this.list_baiviet});

//   baiViets.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['list_baiviet'] != null) {
//       list_baiviet = <BaiViet_model>[];
//       json['list_baiviet'].forEach((v) {
//         list_baiviet!.add(new BaiViet_model.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> list_baiviet = new Map<String, dynamic>();
//     list_baiviet['status'] = this.status;
//     if (this.list_baiviet != null) {
//       list_baiviet['list_baiviet'] =
//           this.list_baiviet!.map((v) => v.toJson()).toList();
//     }
//     return list_baiviet;
//   }
// }

// class BaiViet_model {
//   int? id;
//   int? idBoMon;
//   int? idLop;
//   String? avt;
//   int? trangThai;
//   String? createdAt;
//   String? updatedAt;
//   int? idLopHocPhan;
//   int? idLoaiBaiViet;
//   int? idSinhVien;
//   int? idGiangVien;
//   String? noiDung;
//   String? noidungBaiViet;
//   String? tenLoai;
//   int? idKhoa;
//   int? idChucVu;
//   String? email;
//   String? password;
//   String? maSo;
//   String? sdt;
//   String? hoTen;
//   String? ngaySinh;
//   String? tenFile;
//   String? loaiFile;

//   BaiViet_model(
//       {this.id,
//       this.idBoMon,
//       this.idLop,
//       this.avt,
//       this.trangThai,
//       this.createdAt,
//       this.updatedAt,
//       this.idLopHocPhan,
//       this.idLoaiBaiViet,
//       this.idSinhVien,
//       this.idGiangVien,
//       this.noiDung,
//       this.noidungBaiViet,
//       this.tenLoai,
//       this.idKhoa,
//       this.idChucVu,
//       this.email,
//       this.password,
//       this.maSo,
//       this.sdt,
//       this.hoTen,
//       this.ngaySinh,
//       this.tenFile,
//       this.loaiFile});

//   BaiViet_model.fromJson(Map<String, dynamic> json) {
//     if (json['created_at'] != null) {
//       createdAt = json['created_at'];
//     } else {
//       createdAt = '';
//     }
//     ;
//     if (json['updated_at'] != null) {
//       updatedAt = json['updated_at'];
//     } else {
//       updatedAt = '';
//     }
//     ;
//     if (json['id_lop_hoc_phan'] != null) {
//       idLopHocPhan = json['id_lop_hoc_phan'];
//     } else {
//       idLopHocPhan = 0;
//     }
//     ;
//     if (json['id_loai_bai_viet'] != null) {
//       idLoaiBaiViet = json['id_loai_bai_viet'];
//     } else {
//       idLoaiBaiViet = 0;
//     }
//     ;
//     if (json['id_sinh_vien'] != null) {
//       idSinhVien = json['id_sinh_vien'];
//     } else {
//       idSinhVien = 0;
//     }
//     ;
//     if (json['id_giang_vien'] != null) {
//       idGiangVien = json['id_giang_vien'];
//     } else {
//       idGiangVien = 0;
//     }
//     ;
//     if (json['noi_dung'] != null) {
//       noiDung = json['noi_dung'];
//     } else {
//       noiDung = '';
//     }
//     ;
//     if (json['noidungBaiViet'] != null) {
//       noidungBaiViet = json['noidungBaiViet'];
//     } else {
//       noidungBaiViet = '';
//     }
//     ;
//     if (json['ten_loai'] != null) {
//       tenLoai = json['ten_loai'];
//     } else {
//       tenLoai = '';
//     }
//     ;
//     if (json['id_khoa'] != null) {
//       idKhoa = json['id_khoa'];
//     } else {
//       idKhoa = 0;
//     }
//     ;
//     if (json['id_chuc_vu'] != null) {
//       idChucVu = json['id_chuc_vu'];
//     } else {
//       idChucVu = 0;
//     }
//     ;
//     if (json['email'] != null) {
//       email = json['email'];
//     } else {
//       email = '';
//     }
//     ;
//     if (json['password'] != null) {
//       password = json['password'];
//     } else {
//       password = '';
//     }
//     ;
//     if (json['ma_so'] != null) {
//       maSo = json['ma_so'];
//     } else {
//       maSo = '';
//     }
//     ;
//     if (json['sdt'] != null) {
//       sdt = json['sdt'];
//     } else {
//       sdt = '';
//     }
//     ;
//     if (json['ho_ten'] != null) {
//       hoTen = json['ho_ten'];
//     } else {
//       hoTen = '';
//     }
//     ;
//     if (json['ngay_sinh'] != null) {
//       ngaySinh = json['ngay_sinh'];
//     } else {
//       ngaySinh = '';
//     }
//     ;
//     if (json['ten_file'] != null) {
//       tenFile = json['ten_file'];
//     } else {
//       tenFile = '';
//     }
//     ;
//     if (json['loai_file'] != null) {
//       loaiFile = json['loai_file'];
//     } else {
//       loaiFile = '';
//     }
//     ;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> list_baiviet = new Map<String, dynamic>();
//     list_baiviet['id'] = this.id;
//     list_baiviet['id_bo_mon'] = this.idBoMon;
//     list_baiviet['id_lop'] = this.idLop;
//     list_baiviet['avt'] = this.avt;
//     list_baiviet['trang_thai'] = this.trangThai;
//     list_baiviet['created_at'] = this.createdAt;
//     list_baiviet['updated_at'] = this.updatedAt;
//     list_baiviet['id_lop_hoc_phan'] = this.idLopHocPhan;
//     list_baiviet['id_loai_bai_viet'] = this.idLoaiBaiViet;
//     list_baiviet['id_sinh_vien'] = this.idSinhVien;
//     list_baiviet['id_giang_vien'] = this.idGiangVien;
//     list_baiviet['noi_dung'] = this.noiDung;
//     list_baiviet['noidungBaiViet'] = this.noidungBaiViet;
//     list_baiviet['ten_loai'] = this.tenLoai;
//     list_baiviet['id_khoa'] = this.idKhoa;
//     list_baiviet['id_chuc_vu'] = this.idChucVu;
//     list_baiviet['email'] = this.email;
//     list_baiviet['password'] = this.password;
//     list_baiviet['ma_so'] = this.maSo;
//     list_baiviet['sdt'] = this.sdt;
//     list_baiviet['ho_ten'] = this.hoTen;
//     list_baiviet['ngay_sinh'] = this.ngaySinh;
//     list_baiviet['ten_file'] = this.tenFile;
//     list_baiviet['loai_file'] = this.loaiFile;
//     return list_baiviet;
//   }
// }
import 'package:user_flutter/View/common/constant/string.dart';

class baiViets {
  bool? status;
  List<Data>? data;

  baiViets({this.status, this.data});

  baiViets.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? idBoMon;
  int? idLop;
  String? avt;
  int? trangThai;
  String? createdAt;
  String? updatedAt;
  int? idLopHocPhan;
  int? idLoaiBaiViet;
  int? idSinhVien;
  int? idGiangVien;
  String? noiDung;
  String? noidungBaiViet;
  String? tenLoai;
  int? idKhoa;
  int? idChucVu;
  String? email;
  String? password;
  String? maSo;
  String? sdt;
  String? hoTen;
  String? ngaySinh;
  String? tenFile;
  String? loaiFile;

  Data(
      {this.id,
      this.idBoMon,
      this.idLop,
      this.avt,
      this.trangThai,
      this.createdAt,
      this.updatedAt,
      this.idLopHocPhan,
      this.idLoaiBaiViet,
      this.idSinhVien,
      this.idGiangVien,
      this.noiDung,
      this.noidungBaiViet,
      this.tenLoai,
      this.idKhoa,
      this.idChucVu,
      this.email,
      this.password,
      this.maSo,
      this.sdt,
      this.hoTen,
      this.ngaySinh,
      this.tenFile,
      this.loaiFile});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBoMon = json['id_bo_mon'];
    idLop = json['id_lop'];
    if (json['avt'] != null) {  
      avt = Link + json['avt'];
    } else {
      avt = Link + '/assets/images/no_image.png';
    } 
    trangThai = json['trang_thai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    idLopHocPhan = json['id_lop_hoc_phan'];
    idLoaiBaiViet = json['id_loai_bai_viet'];
    idSinhVien = json['id_sinh_vien'];
    idGiangVien = json['id_giang_vien'];
    noiDung = json['noi_dung'];
    noidungBaiViet = json['noidungBaiViet'];
    tenLoai = json['ten_loai'];
    idKhoa = json['id_khoa'];
    idChucVu = json['id_chuc_vu'];
    email = json['email'];
    password = json['password'];
    maSo = json['ma_so'];
    sdt = json['sdt'];
    hoTen = json['ho_ten'];
    ngaySinh = json['ngay_sinh'];
    tenFile = json['ten_file'];
    loaiFile = json['loai_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_bo_mon'] = this.idBoMon;
    data['id_lop'] = this.idLop;
    data['avt'] = this.avt;
    data['trang_thai'] = this.trangThai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id_lop_hoc_phan'] = this.idLopHocPhan;
    data['id_loai_bai_viet'] = this.idLoaiBaiViet;
    data['id_sinh_vien'] = this.idSinhVien;
    data['id_giang_vien'] = this.idGiangVien;
    data['noi_dung'] = this.noiDung;
    data['noidungBaiViet'] = this.noidungBaiViet;
    data['ten_loai'] = this.tenLoai;
    data['id_khoa'] = this.idKhoa;
    data['id_chuc_vu'] = this.idChucVu;
    data['email'] = this.email;
    data['password'] = this.password;
    data['ma_so'] = this.maSo;
    data['sdt'] = this.sdt;
    data['ho_ten'] = this.hoTen;
    data['ngay_sinh'] = this.ngaySinh;
    data['ten_file'] = this.tenFile;
    data['loai_file'] = this.loaiFile;
    return data;
  }
}
