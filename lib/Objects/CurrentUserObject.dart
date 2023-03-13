class CurrentUserObject {
  String? namaLengkap;
  String? namaPanggilan;
  String? jenisKelamin;
  String? kotaAsal;
  String? tglLahir;
  bool? mukim;
  List<dynamic>? mengajarKelas;

  CurrentUserObject(
      {this.namaLengkap,
      this.namaPanggilan,
      this.jenisKelamin,
      this.kotaAsal,
      this.tglLahir,
      this.mukim,
      this.mengajarKelas});
}
