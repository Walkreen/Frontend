class DailyResponse {
  String? _completionDate;
  bool? _missionA;
  bool? _missionB;
  bool? _missionC;
  bool? _missionD;
  bool? _missionE;

  DailyResponse(
      {String? completionDate,
        bool? missionA,
        bool? missionB,
        bool? missionC,
        bool? missionD,
        bool? missionE}) {
    if (completionDate != null) {
      this._completionDate = completionDate;
    }
    if (missionA != null) {
      this._missionA = missionA;
    }
    if (missionB != null) {
      this._missionB = missionB;
    }
    if (missionC != null) {
      this._missionC = missionC;
    }
    if (missionD != null) {
      this._missionD = missionD;
    }
    if (missionE != null) {
      this._missionE = missionE;
    }
  }

  String? get completionDate => _completionDate;
  set completionDate(String? completionDate) =>
      _completionDate = completionDate;
  bool? get missionA => _missionA;
  set missionA(bool? missionA) => _missionA = missionA;
  bool? get missionB => _missionB;
  set missionB(bool? missionB) => _missionB = missionB;
  bool? get missionC => _missionC;
  set missionC(bool? missionC) => _missionC = missionC;
  bool? get missionD => _missionD;
  set missionD(bool? missionD) => _missionD = missionD;
  bool? get missionE => _missionE;
  set missionE(bool? missionE) => _missionE = missionE;

  DailyResponse.fromJson(Map<String, dynamic> json) {
    _completionDate = json['completionDate'];
    _missionA = json['missionA'];
    _missionB = json['missionB'];
    _missionC = json['missionC'];
    _missionD = json['missionD'];
    _missionE = json['missionE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['completionDate'] = this._completionDate;
    data['missionA'] = this._missionA;
    data['missionB'] = this._missionB;
    data['missionC'] = this._missionC;
    data['missionD'] = this._missionD;
    data['missionE'] = this._missionE;
    return data;
  }
}
