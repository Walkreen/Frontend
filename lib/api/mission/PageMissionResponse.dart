import 'package:capstone/api/mission/MissionResponse.dart';

class PageMissionResponse {
  List<MissionResponse>? _missions;
  int? _userId;

  PageMissionResponse({List<MissionResponse>? missions, int? userId}) {
    if (missions != null) {
      this._missions = missions;
    }
    if (userId != null) {
      this._userId = userId;
    }
  }

  List<MissionResponse>? get missions => _missions;
  set missions(List<MissionResponse>? missions) => _missions = missions;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;

  PageMissionResponse.fromJson(Map<String, dynamic> json) {
    if (json['missions'] != null) {
      _missions = <MissionResponse>[];
      json['missions'].forEach((v) {
        _missions!.add(new MissionResponse.fromJson(v));
      });
    }
    _userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._missions != null) {
      data['missions'] = this._missions!.map((v) => v.toJson()).toList();
    }
    data['userId'] = this._userId;
    return data;
  }
}