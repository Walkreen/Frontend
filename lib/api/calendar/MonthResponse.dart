class MonthResponse {
  String? _calendar;
  List<MissionScoreResponse>? _missionScoreResponses;
  int? _userId;

  MonthResponse(
      {String? calendar,
        List<MissionScoreResponse>? missionScoreResponses,
        int? userId}) {
    if (calendar != null) {
      this._calendar = calendar;
    }
    if (missionScoreResponses != null) {
      this._missionScoreResponses = missionScoreResponses;
    }
    if (userId != null) {
      this._userId = userId;
    }
  }

  String? get calendar => _calendar;
  set calendar(String? calendar) => _calendar = calendar;
  List<MissionScoreResponse>? get missionScoreResponses =>
      _missionScoreResponses;
  set missionScoreResponses(
      List<MissionScoreResponse>? missionScoreResponses) =>
      _missionScoreResponses = missionScoreResponses;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;

  MonthResponse.fromJson(Map<String, dynamic> json) {
    _calendar = json['calendar'];
    if (json['missionScoreResponses'] != null) {
      _missionScoreResponses = <MissionScoreResponse>[];
      json['missionScoreResponses'].forEach((v) {
        _missionScoreResponses!.add(new MissionScoreResponse.fromJson(v));
      });
    }
    _userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calendar'] = this._calendar;
    if (this._missionScoreResponses != null) {
      data['missionScoreResponses'] =
          this._missionScoreResponses!.map((v) => v.toJson()).toList();
    }
    data['userId'] = this._userId;
    return data;
  }
}

class MissionScoreResponse {
  String? _date;
  String? _score;

  MissionScoreResponse({String? date, String? score}) {
    if (date != null) {
      this._date = date;
    }
    if (score != null) {
      this._score = score;
    }
  }

  String? get date => _date;
  set date(String? date) => _date = date;
  String? get score => _score;
  set score(String? score) => _score = score;

  MissionScoreResponse.fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    _score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this._date;
    data['score'] = this._score;
    return data;
  }
}
