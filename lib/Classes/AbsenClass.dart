import 'package:esantren_v1/Objects/AbsenObject.dart';

class AbsenClass {
  late List<AbsenObject> dataAbsenSantri;
  List<AbsenObject> getData() {
    dataAbsenSantri = <AbsenObject>[
      AbsenObject(
          'DU15230001', 'Muhammad Fajrul Alam Ulin Nuha', 'Kamar 1', 'Hadir'),
      AbsenObject('DU15230002', ' Muhammad Ghinan Navsih', 'Kamar 2', 'Hadir'),
      AbsenObject('DU15230003', 'Muhammad Rekyan', 'Kamar 2', 'Hadir'),
      AbsenObject('DU15230004', 'Bagus Al-Fikri', 'Kamar 5', 'Hadir'),
      AbsenObject('DU15230005', 'Abdul Sholeh', 'Kamar 4', 'Hadir'),
      AbsenObject('DU15230006', 'Ariasatya Mahatma', 'Kamar 3', 'Hadir'),
      AbsenObject(
          'DU15230007', 'Naufal Sirullah Ahmad Sunandar', 'Kamar 1', 'Hadir'),
      AbsenObject('DU15230008', 'Dwiki Cahyo', 'Kamar 3', 'Hadir'),
      AbsenObject('DU15230009', 'Ahmad Giffar', 'Kamar 6', 'Hadir'),
      AbsenObject('DU15230009', 'Tio Arya', 'Kamar 6', 'Hadir'),
    ];

    return dataAbsenSantri;
  }

  int getJumlahSantriDiKamar(String kamar, List<AbsenObject> dataSantri) {
    int jumlahSantriDiKamar = 0;

    dataSantri.forEach((santri) {
      if (santri.kamar == kamar) {
        print(kamar);
        print(santri.kamar);
        jumlahSantriDiKamar++;
      }
    });

    return jumlahSantriDiKamar;
  }
}
