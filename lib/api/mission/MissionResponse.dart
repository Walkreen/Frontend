class MissionResponse {
  String? _contents;
  String? _endTime;
  int? _missionId;
  int? _people;
  int? _reward;
  String? _startTime;
  String? _status;
  String? _title;

  MissionResponse(
      {String? contents,
        String? endTime,
        int? missionId,
        int? people,
        int? reward,
        String? startTime,
        String? status,
        String? title}) {
    if (contents != null) {
      this._contents = contents;
    }
    if (endTime != null) {
      this._endTime = endTime;
    }
    if (missionId != null) {
      this._missionId = missionId;
    }
    if (people != null) {
      this._people = people;
    }
    if (reward != null) {
      this._reward = reward;
    }
    if (startTime != null) {
      this._startTime = startTime;
    }
    if (status != null) {
      this._status = status;
    }
    if (title != null) {
      this._title = title;
    }
  }

  String? get contents => _contents;
  set contents(String? contents) => _contents = contents;
  String? get endTime => _endTime;
  set endTime(String? endTime) => _endTime = endTime;
  int? get missionId => _missionId;
  set missionId(int? missionId) => _missionId = missionId;
  int? get people => _people;
  set people(int? people) => _people = people;
  int? get reward => _reward;
  set reward(int? reward) => _reward = reward;
  String? get startTime => _startTime;
  set startTime(String? startTime) => _startTime = startTime;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get title => _title;
  set title(String? title) => _title = title;

  MissionResponse.fromJson(Map<String, dynamic> json) {
    _contents = json['contents'];
    _endTime = json['endTime'];
    _missionId = json['missionId'];
    _people = json['people'];
    _reward = json['reward'];
    _startTime = json['startTime'];
    _status = json['status'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contents'] = this._contents;
    data['endTime'] = this._endTime;
    data['missionId'] = this._missionId;
    data['people'] = this._people;
    data['reward'] = this._reward;
    data['startTime'] = this._startTime;
    data['status'] = this._status;
    data['title'] = this._title;
    return data;
  }
}
