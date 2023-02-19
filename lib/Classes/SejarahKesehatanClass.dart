import 'package:esantren_v1/Objects/KesehatanObject.dart';

class SejarahKesehatan {
  late List<KesehatanObject> _sejarahKesehatan = [];

  List<KesehatanObject> getData(String id) {
    _sejarahKesehatan.clear();
    switch (id) {
      case 'DU15230001':
        _sejarahKesehatan = <KesehatanObject>[
          KesehatanObject('DU15230001', 'Muhammad Fajrul Alam Ulin Nuha',
              'images/foto_formal.jpg', '17-02-2023', true,
              keluhan: "Radang tenggorokan",
              dirawatDi: "RSUM",
              keterangan: "amandelnya bengkak",
              sudahPeriksa: false,
              updateTimestamp: '15-01-2023 16:54'),
          KesehatanObject('DU15230001', 'Muhammad Fajrul Alam Ulin Nuha',
              'images/foto_formal.jpg', '17-02-2023', true,
              keluhan: "Sakit perut",
              dirawatDi: "Asrama",
              keterangan: "mules",
              sudahPeriksa: true,
              periksaDi: "dr Ansita",
              suhuTubuh: 38,
              tensi: "90/130",
              diagnosa: "tipes",
              preskripsi:
                  "obat (terlampir) dan banyak istirahat, tidur cukup, dan hindari makanan berserat tinggi",
              updateTimestamp: "16-02-2023 17:34"),
        ];
        break;
      case 'DU15230002':
        break;
      case 'DU15230003':
        _sejarahKesehatan = <KesehatanObject>[
          KesehatanObject('DU15230003', 'Muhammad Rekyan',
              'images/foto_formal.jpg', '17-02-2023', true,
              keluhan: "Demam",
              dirawatDi: "Asrama",
              keterangan: "batuk dan pilek juga",
              sudahPeriksa: true,
              periksaDi: "RSUM",
              suhuTubuh: 38,
              tensi: "90/130",
              diagnosa: "diare",
              preskripsi: "jangan kebanyakan makan makanan pedas",
              updateTimestamp: "16-02-2023 17:34"),
        ];
        break;
      case 'DU15230004':
        _sejarahKesehatan = <KesehatanObject>[
          KesehatanObject('DU15230004', 'Abdul Sholeh',
              'images/foto_formal.jpg', '17-02-2023', true,
              keluhan: "Pusing",
              dirawatDi: "Asrama",
              keterangan: "pusing dan mual",
              sudahPeriksa: false,
              updateTimestamp: "17-02-2023 09:27")
        ];
    }

    return _sejarahKesehatan;
  }
}
