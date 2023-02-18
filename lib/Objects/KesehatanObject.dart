import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KesehatanObject {
  String id;
  String nama;
  String imagePath;
  String tanggal;
  bool sudahAdaDetail;
  String? keluhan;
  String? dirawatDi;
  String? keterangan;
  bool? sudahPeriksa;
  String? periksaDi;
  int? suhuTubuh;
  String? tensi;
  String? diagnosa;
  String? preskripsi;

  KesehatanObject(
      this.id, this.nama, this.imagePath, this.tanggal, this.sudahAdaDetail,
      {this.keluhan,
      this.keterangan,
      this.dirawatDi,
      this.sudahPeriksa,
      this.periksaDi,
      this.suhuTubuh,
      this.tensi,
      this.diagnosa,
      this.preskripsi});
}
