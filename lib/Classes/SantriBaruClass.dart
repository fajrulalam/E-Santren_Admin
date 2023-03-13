import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SantriBaru {
  String nama;
  String alamat;
  String tglLahir;
  String kotaAsal;
  String namaWali;
  String noHP;
  String jenisKelamin = 'L';
  String jenjangPendidikan;
  String kelas;
  String unitSekolah;
  DateTime tglMasuk = DateTime.now();
  String statusAktif = 'Aktif';
  String kamar;
  bool lunasSPP = true;
  String pembayaranTerakhir = "-";
  String kelasMengaji;

  SantriBaru.named(
      this.nama,
      this.alamat,
      this.noHP,
      this.tglLahir,
      this.kotaAsal,
      this.namaWali,
      this.kelas,
      this.jenjangPendidikan,
      this.unitSekolah,
      this.kamar,
      this.kelasMengaji);

  void addToFirebase(BuildContext context, SantriBaru santriBaru) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16),
              Text("Signing in...")
            ],
          ),
        );
      },
    );
    String kodeAsrama = 'DU15';
    String kodeTahun = DateTime.now().year.toString().substring(2);
    int kodeAbsen = await getCurrentId() + 1;
    String kodeAbsen_str = kodeAbsen.toString().padLeft(6, '0');

    String id = kodeAsrama + kodeTahun + kodeAbsen_str;
    Map<String, Object> dataSantriBaru = {
      "nama": santriBaru.nama,
      "alamat": santriBaru.alamat,
      "noHP": santriBaru.noHP,
      "tglLahir": santriBaru.tglLahir,
      "kotaAsal": santriBaru.kotaAsal,
      "namaWali": santriBaru.namaWali,
      "kelas": santriBaru.kelas,
      "jenjangPendidikan": santriBaru.jenjangPendidikan,
      "unitSekolah": santriBaru.unitSekolah,
      "kamar": santriBaru.kamar,
      "kelasNgaji": santriBaru.kelasMengaji,
      "jenisKelamin": 'L',
      "tglMasuk": FieldValue.serverTimestamp(),
      "statusAktif": 'Aktif',
      "lunasSPP": true,
      "pembayaranTerakhir": "-"
    };

    db.collection('SantriCollection').doc(id).set(dataSantriBaru).then((value) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 750),
          content: Text('Sdr. ${santriBaru.nama} berhasil ditambahkan'),
        ),
      );
    }).catchError((error) => print('Add failed: $error'));
  }

  static Future<int> getCurrentId() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('SantriCollection');

    QuerySnapshot snapshot =
        await users.orderBy('tglMasuk', descending: true).limit(1).get();
    if (snapshot.docs.isEmpty) {
      return 0;
    }
    String currentId = snapshot.docs.first.id;

    currentId = currentId.substring(6);
    currentId.replaceAll("TEST", "");
    // print(int.parse(currentId));

    print(int.parse(currentId));
    return int.parse(currentId);
  }
}
