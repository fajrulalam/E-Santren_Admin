import 'package:esantren_v1/Objects/SejarahPembayaranObject.dart';
import 'package:flutter/cupertino.dart';

class SejarahPembayaranClass {
  late List<SejarahPembayaranObject> _dataPembayaranSantri = [];
  List<String> sejarahPembayaranList = [];

  late List<InvoiceObject> dataInvoice = [];
  List<String> invoiceList = [];

  late List<SejarahPembayaranInvoiceObject> dataSejarahPembayaranInvoice = [];

  set dataPembayaranSantri(List<SejarahPembayaranObject> value) {
    _dataPembayaranSantri = value;
  } //ini nanti yang dikirim ke ListView

  String id;

  SejarahPembayaranClass(this.id);

  List<SejarahPembayaranObject> getDataPaymentHistory(String id) {
    _dataPembayaranSantri.clear();
    switch (id) {
      case 'DU15230001':
        sejarahPembayaranList = [
          'November 2022',
          "Desember 2022",
          "Januari 2023",
          "Februari 2023"
        ];
        _dataPembayaranSantri = <SejarahPembayaranObject>[
          SejarahPembayaranObject(
              pembayaranBulan: 'November 2022',
              tanggalPembayaran: '12-11-2022',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Desember 2022',
              tanggalPembayaran: '05-12-2022',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Januari 2023',
              tanggalPembayaran: '15-01-2023',
              diterimaOleh: "Mundzir",
              keterangan: "sekalian bayar untuk bulan depan"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Februari 2023',
              tanggalPembayaran: '25-12-2023',
              diterimaOleh: "Mundzir",
              keterangan: "sudah lunas sejak bulan lalu")
        ];
        break;
      case 'DU15230002':
        sejarahPembayaranList = [
          'November 2022',
          "Desember 2022",
          "Januari 2023"
        ];
        _dataPembayaranSantri = <SejarahPembayaranObject>[
          SejarahPembayaranObject(
              pembayaranBulan: 'November 2022',
              tanggalPembayaran: '12-11-2022',
              diterimaOleh: "Udin"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Desember 2022',
              tanggalPembayaran: '05-12-2022',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Januari 2023',
              tanggalPembayaran: '15-01-2023',
              diterimaOleh: "Mumtaz"),
        ];
        break;
      case 'DU15230003':
        sejarahPembayaranList = [
          'November 2022',
          "Desember 2022",
          "Januari 2023",
          "Februari 2023"
        ];
        _dataPembayaranSantri = <SejarahPembayaranObject>[
          SejarahPembayaranObject(
              pembayaranBulan: 'November 2022',
              tanggalPembayaran: '12-11-2022',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Desember 2022',
              tanggalPembayaran: '05-12-2022',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Januari 2023',
              tanggalPembayaran: '15-01-2023',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Februari 2023',
              tanggalPembayaran: '25-12-2023',
              diterimaOleh: "Mundzir")
        ];
        break;
      case 'DU15230004':
        sejarahPembayaranList = [
          'November 2022',
          "Desember 2022",
          "Januari 2023",
          "Februari 2023"
        ];
        _dataPembayaranSantri = <SejarahPembayaranObject>[
          SejarahPembayaranObject(
              pembayaranBulan: 'November 2022',
              tanggalPembayaran: '12-11-2022',
              diterimaOleh: "Mumtaz"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Desember 2022',
              tanggalPembayaran: '05-12-2022',
              diterimaOleh: "Shobari"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Januari 2023',
              tanggalPembayaran: '15-01-2023',
              diterimaOleh: "Shobari"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Februari 2023',
              tanggalPembayaran: '25-12-2023',
              diterimaOleh: "Shobari")
        ];
        break;
      case 'DU15230005':
        sejarahPembayaranList = [
          'November 2022',
          "Desember 2022",
          "Januari 2023",
          "Februari 2023"
        ];
        _dataPembayaranSantri = <SejarahPembayaranObject>[
          SejarahPembayaranObject(
              pembayaranBulan: 'November 2022',
              tanggalPembayaran: '12-11-2022',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Desember 2022',
              tanggalPembayaran: '05-12-2022',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Januari 2023',
              tanggalPembayaran: '15-01-2023',
              diterimaOleh: "Shobari",
              keterangan: "sekalian bayar untuk bulan depan"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Februari 2023',
              tanggalPembayaran: '25-12-2023',
              diterimaOleh: "Mundzir",
              keterangan: "sudah lunas sejak bulan lalu")
        ];
        break;
      case 'DU15230006':
        sejarahPembayaranList = [
          'November 2022',
          "Desember 2022",
          "Februari 2023"
        ];

        _dataPembayaranSantri = <SejarahPembayaranObject>[
          SejarahPembayaranObject(
              pembayaranBulan: 'November 2022',
              tanggalPembayaran: '12-11-2022',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Januari 2023',
              tanggalPembayaran: '15-01-2023',
              diterimaOleh: "Shobari"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Februari 2023',
              tanggalPembayaran: '25-12-2023',
              diterimaOleh: "Mundzir")
        ];
        break;
      case 'DU15230007':
        sejarahPembayaranList = [
          "Desember 2022",
          "Januari 2023",
          "Februari 2023"
        ];

        _dataPembayaranSantri = <SejarahPembayaranObject>[
          SejarahPembayaranObject(
              pembayaranBulan: 'Desember 2022',
              tanggalPembayaran: '05-12-2022',
              diterimaOleh: "Mumtaz"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Januari 2023',
              tanggalPembayaran: '15-01-2023',
              diterimaOleh: "Shobari"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Februari 2023',
              tanggalPembayaran: '25-12-2023',
              diterimaOleh: "Mundzir")
        ];
        break;
      case 'DU15230008':
        sejarahPembayaranList = [
          'November 2022',
          "Desember 2022",
          "Januari 2023",
          "Februari 2023"
        ];
        _dataPembayaranSantri = <SejarahPembayaranObject>[
          SejarahPembayaranObject(
              pembayaranBulan: 'November 2022',
              tanggalPembayaran: '12-11-2022',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Desember 2022',
              tanggalPembayaran: '05-12-2022',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Januari 2023',
              tanggalPembayaran: '15-01-2023',
              diterimaOleh: "Mundzir",
              keterangan: "sekalian bayar untuk bulan depan"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Februari 2023',
              tanggalPembayaran: '25-12-2023',
              diterimaOleh: "Mundzir",
              keterangan: "sudah lunas sejak bulan lalu")
        ];
        break;
      case 'DU15230009':
        sejarahPembayaranList = [
          'November 2022',
          "Desember 2022",
          "Februari 2023"
        ];

        _dataPembayaranSantri = <SejarahPembayaranObject>[
          SejarahPembayaranObject(
              pembayaranBulan: 'November 2022',
              tanggalPembayaran: '12-11-2022',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Desember 2022',
              tanggalPembayaran: '05-12-2022',
              diterimaOleh: "Shobari"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Februari 2023',
              tanggalPembayaran: '25-12-2023',
              diterimaOleh: "Mundzir")
        ];
        break;
      case 'DU15230010':
        sejarahPembayaranList = [
          'November 2022',
          "Desember 2022",
          "Januari 2023"
        ];
        _dataPembayaranSantri = <SejarahPembayaranObject>[
          SejarahPembayaranObject(
              pembayaranBulan: 'November 2022',
              tanggalPembayaran: '12-11-2022',
              diterimaOleh: "Shobari"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Desember 2022',
              tanggalPembayaran: '05-12-2022',
              diterimaOleh: "Mundzir"),
          SejarahPembayaranObject(
              pembayaranBulan: 'Februari 2023',
              tanggalPembayaran: '25-12-2023',
              diterimaOleh: "Mumtaz")
        ];
        break;
    }

    return _dataPembayaranSantri;
  }

  List<InvoiceObject> getInvoiceList() {
    //Function ini nanti menerima TglMasukSantri sebagai parameter.
    //Parameter tersebut akan digunakan untuk memilih tagihan mana saja yang relevan untuk ditampilkan

    invoiceList = [
      'November 2022',
      'Desember 2022',
      'Januari 2023',
      'Februari 2023'
    ];

    dataInvoice = <InvoiceObject>[
      InvoiceObject('November 2022', '01-11-2022'),
      InvoiceObject('Desember 2022', '01-12-2022'),
      InvoiceObject('Januari 2023', '01-01-2023'),
      InvoiceObject('Februari 2023', '01-02-2023'),
    ];

    return dataInvoice;
  }

  List<SejarahPembayaranInvoiceObject> getSejarahPembayaranInvoice() {
    getDataPaymentHistory(id);
    getInvoiceList();

    // //misal yang urut adalah yang data invoice
    // for (int index = 0; index < dataInvoice.length; index++) {
    //   int indexOf = invoiceList.indexOf(sejarahPembayaranList[index]);
    // }

    int index;

    dataInvoice.forEach((bulanInvoice) {
      index = _dataPembayaranSantri.indexWhere(
          (element) => element.pembayaranBulan == bulanInvoice.pembayaranBulan);

      print('${bulanInvoice.pembayaranBulan} ${_dataPembayaranSantri[0]}');

      if (index == -1) {
        dataSejarahPembayaranInvoice.add(SejarahPembayaranInvoiceObject(
            bulanInvoice.pembayaranBulan, "Belum dibayar", "", false));
        return;
      }
      dataSejarahPembayaranInvoice.add(SejarahPembayaranInvoiceObject(
          _dataPembayaranSantri[index].pembayaranBulan!,
          _dataPembayaranSantri[index].tanggalPembayaran!,
          _dataPembayaranSantri[index].diterimaOleh!,
          true));
    });

    return dataSejarahPembayaranInvoice;
  }
}
