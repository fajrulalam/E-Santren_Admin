class AbsenObject {
  String id;
  String nama;
  String kamar;
  String _statusKehadiran;
  bool lunasSPP;

  AbsenObject(
      this.id, this.nama, this.kamar, this._statusKehadiran, this.lunasSPP);

  String get statusKehadiran => _statusKehadiran;

  set statusKehadiran(String value) {
    _statusKehadiran = value;
  }
}
