import 'package:esantren_v1/Objects/KesehatanObject.dart';
import 'package:flutter/cupertino.dart';

class KesehatanClass {
  late List<KesehatanObject> dataAbsenSantri;
  List<KesehatanObject> getData() {
    dataAbsenSantri = <KesehatanObject>[
      KesehatanObject('DU15230001', 'Muhammad Fajrul Alam Ulin Nuha',
          'images/foto_formal.jpg', '17-02-2023', false),
      KesehatanObject('DU15230002', 'Naufal Sirullah Ahmad Sunandar',
          'images/foto_formal.jpg', '17-02-2023', false),
      KesehatanObject('DU15230003', 'Muhammad Rekyan', 'images/foto_formal.jpg',
          '17-02-2023', true),
      KesehatanObject('DU15230004', 'Abdul Sholeh', 'images/foto_formal.jpg',
          '17-02-2023', true),
    ];

    return dataAbsenSantri;
  }

  int getItemCount(
      List<KesehatanObject> dataKesehatanSantri, bool sudahPeriksa) {
    int count = 0;

    dataKesehatanSantri.forEach((element) {
      if (element.sudahAdaDetail == sudahPeriksa) {
        count++;
      }
    });
    return count;
  }
}
