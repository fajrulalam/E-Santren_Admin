import 'package:esantren_v1/Objects/AbsenObject.dart';

class AbsenClass {
  late List<AbsenObject> dataAbsenSantri;
  List<AbsenObject> getData() {
    dataAbsenSantri = <AbsenObject>[
      AbsenObject('DU15230001', 'Muhammad Fajrul Alam Ulin Nuha', 'Kamar 1',
          'Hadir', true),
      AbsenObject(
          'DU15230002', 'Muhammad Ghinan Navsih', 'Kamar 2', 'Alfa', false),
      AbsenObject('DU15230003', 'Muhammad Rekyan', 'Kamar 2', 'Sakit', true),
      AbsenObject('DU15230004', 'Bagus Al-Fikri', 'Kamar 5', 'Hadir', true),
      AbsenObject('DU15230005', 'Abdul Sholeh', 'Kamar , false4', 'Alfa', true),
      AbsenObject('DU15230006', 'Ariasatya Mahatma', 'Kamar 3', 'Sakit', false),
      AbsenObject('DU15230007', 'Naufal Sirullah Ahmad Sunandar', 'Kamar 1',
          'Hadir', false),
      AbsenObject('DU15230008', 'Dwiki Cahyo', 'Kamar 3', 'Alfa', true),
      AbsenObject('DU15230009', 'Ahmad Giffar', 'Kamar 6', 'Sakit', false),
      AbsenObject('DU15230010', 'Tio Arya', 'Kamar 6', 'Hadir', true),
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
