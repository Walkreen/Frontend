import 'package:capstone/api/daily/DailyResponse.dart';
import 'package:capstone/api/mission/MissionResponse.dart';

class DayResponse {
  DailyResponse? _dailyResponse;
  List<MissionResponse>? _missionResponses;
  int? _userId;

  DayResponse(
      {DailyResponse? dailyResponse,
        List<MissionResponse>? missionResponses,
        int? userId}) {
    if (dailyResponse != null) {
      this._dailyResponse = dailyResponse;
    }
    if (missionResponses != null) {
      this._missionResponses = missionResponses;
    }
    if (userId != null) {
      this._userId = userId;
    }
  }

  DailyResponse? get dailyResponse => _dailyResponse;
  set dailyResponse(DailyResponse? dailyResponse) =>
      _dailyResponse = dailyResponse;
  List<MissionResponse>? get missionResponses => _missionResponses;
  set missionResponses(List<MissionResponse>? missionResponses) =>
      _missionResponses = missionResponses;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;

  DayResponse.fromJson(Map<String, dynamic> json) {
    _dailyResponse = json['dailyResponse'] != null
        ? new DailyResponse.fromJson(json['dailyResponse'])
        : null;
    if (json['missionResponses'] != null) {
      _missionResponses = <MissionResponse>[];
      json['missionResponses'].forEach((v) {
        _missionResponses!.add(new MissionResponse.fromJson(v));
      });
    }
    _userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._dailyResponse != null) {
      data['dailyResponse'] = this._dailyResponse!.toJson();
    }
    if (this._missionResponses != null) {
      data['missionResponses'] =
          this._missionResponses!.map((v) => v.toJson()).toList();
    }
    data['userId'] = this._userId;
    return data;
  }
}