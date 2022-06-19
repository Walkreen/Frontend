class DinfoResponse {
  int? _accdate;
  int? _missionAsum;
  int? _missionBsum;
  int? _missionCsum;
  int? _missionDsum;
  int? _missionEsum;

  DinfoResponse(
      {int? accdate,
        int? missionAsum,
        int? missionBsum,
        int? missionCsum,
        int? missionDsum,
        int? missionEsum}) {
    if (accdate != null) {
      this._accdate = accdate;
    }
    if (missionAsum != null) {
      this._missionAsum = missionAsum;
    }
    if (missionBsum != null) {
      this._missionBsum = missionBsum;
    }
    if (missionCsum != null) {
      this._missionCsum = missionCsum;
    }
    if (missionDsum != null) {
      this._missionDsum = missionDsum;
    }
    if (missionEsum != null) {
      this._missionEsum = missionEsum;
    }
  }

  int? get accdate => _accdate;
  set accdate(int? accdate) => _accdate = accdate;
  int? get missionAsum => _missionAsum;
  set missionAsum(int? missionAsum) => _missionAsum = missionAsum;
  int? get missionBsum => _missionBsum;
  set missionBsum(int? missionBsum) => _missionBsum = missionBsum;
  int? get missionCsum => _missionCsum;
  set missionCsum(int? missionCsum) => _missionCsum = missionCsum;
  int? get missionDsum => _missionDsum;
  set missionDsum(int? missionDsum) => _missionDsum = missionDsum;
  int? get missionEsum => _missionEsum;
  set missionEsum(int? missionEsum) => _missionEsum = missionEsum;

  DinfoResponse.fromJson(Map<String, dynamic> json) {
    _accdate = json['accdate'];
    _missionAsum = json['missionAsum'];
    _missionBsum = json['missionBsum'];
    _missionCsum = json['missionCsum'];
    _missionDsum = json['missionDsum'];
    _missionEsum = json['missionEsum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accdate'] = this._accdate;
    data['missionAsum'] = this._missionAsum;
    data['missionBsum'] = this._missionBsum;
    data['missionCsum'] = this._missionCsum;
    data['missionDsum'] = this._missionDsum;
    data['missionEsum'] = this._missionEsum;
    return data;
  }
}
