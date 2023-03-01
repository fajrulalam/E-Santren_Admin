//Ini yang diambil dari database collection pembayaran search by ID santri
class SejarahPembayaranObject {
  String? id;
  String? nama;
  String? pembayaranBulan;
  String? tanggalPembayaran;
  String? keterangan;
  String? diterimaOleh;

  SejarahPembayaranObject(
      {this.id,
      this.nama,
      this.pembayaranBulan,
      this.tanggalPembayaran,
      this.keterangan,
      this.diterimaOleh});
}

//Ini diambil dari database collection invoice
class InvoiceObject {
  String pembayaranBulan;
  String tanggalPembuatanInvoice;
  int nominal;

  InvoiceObject(
      this.pembayaranBulan, this.tanggalPembuatanInvoice, this.nominal);
}

//Ini adalah class yang didapatkan setelah memproses invoice2 yang relevan
// 1. bandingkan dengan tanggal santri masuk di asrama dan
// 2. menggunakan indexOf untuk mencari apakah santri sudah membayar

class SejarahPembayaranInvoiceObject {
  String pembayaranBulan;
  String tanggalPembayaran;
  String diterimaOleh;
  int nominal;
  bool lunas;
  String? id;
  String? nama;
  String? keterangan;

  SejarahPembayaranInvoiceObject(this.pembayaranBulan, this.tanggalPembayaran,
      this.diterimaOleh, this.nominal, this.lunas,
      {this.id, this.nama, this.keterangan});
}
