import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esantren_v1/Objects/CurrentUserObject.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Authentication.dart';

class CurrentUserClass {
  final User? user = Auth().currentUser;

  Future<CurrentUserObject> getUserDetail() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    late CurrentUserObject currrentUserObject;

    await db
        .collection("PengurusCollection")
        .doc(user?.uid)
        .get()
        .then((value) {
      String namaLengkap = value.get("namaLengkap").toString();
      String namaPanggilan = value.get("namaPanggilan").toString();
      String jenisKelamin = value.get("jenisKelamin").toString();
      String kotaAsal = value.get("kotaAsal").toString();
      String tglLahir = value.get("tglLahir").toString();
      String mukim_str = value.get("mukim").toString();
      bool mukim = mukim_str == 'true';
      List<dynamic> mengajarKelas = value.get("mengajarKelas");
      currrentUserObject = CurrentUserObject(
          namaLengkap: namaLengkap,
          namaPanggilan: namaPanggilan,
          jenisKelamin: jenisKelamin,
          kotaAsal: kotaAsal,
          tglLahir: tglLahir,
          mukim: mukim,
          mengajarKelas: mengajarKelas);
      print('Berhasil mendapatkan $namaPanggilan');
    });

    return currrentUserObject;
  }
}
