class AbsenObject {
  String id;
  String nama;
  String kamar;
  String _statusKehadiran;

  AbsenObject(this.id, this.nama, this.kamar, this._statusKehadiran);

  String get statusKehadiran => _statusKehadiran;

  set statusKehadiran(String value) {
    _statusKehadiran = value;
  }
}
