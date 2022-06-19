class DailyRequest {
  String? _completionDate;
  String? _mission;

  DailyRequest({String? completionDate, String? mission}) {
    if (completionDate != null) {
      this._completionDate = completionDate;
    }
    if (mission != null) {
      this._mission = mission;
    }
  }

  String? get completionDate => _completionDate;
  set completionDate(String? completionDate) =>
      _completionDate = completionDate;
  String? get mission => _mission;
  set mission(String? mission) => _mission = mission;

  DailyRequest.fromJson(Map<String, dynamic> json) {
    _completionDate = json['completionDate'];
    _mission = json['mission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['completionDate'] = this._completionDate;
    data['mission'] = this._mission;
    return data;
  }
}
