class ThongKeM {
  bool? status;
  int? dagiao;
  int? hoanthanh;
  int? noptre;
  int? chuanop;

  ThongKeM(
      {this.status, this.dagiao, this.hoanthanh, this.noptre, this.chuanop});

  ThongKeM.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    dagiao = json['dagiao'];
    hoanthanh = json['hoanthanh'];
    noptre = json['noptre'];
    chuanop = json['chuanop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['dagiao'] = this.dagiao;
    data['hoanthanh'] = this.hoanthanh;
    data['noptre'] = this.noptre;
    data['chuanop'] = this.chuanop;
    return data;
  }
}
