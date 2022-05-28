import 'package:climbing_sessions/src/models/climb_model.dart';

class Sesh {
  int? _id;
  DateTime? _dateTime;
  int? _climbsCompleted;
  int? _totalAttempts;
  int? _averageGrade;
  int? _highestGrade;

  List<Climb>? _climbs;
  List<Climb>? get climbs => _climbs;

  Sesh({
    required id,
    required dateTime,
    required climbsCompleted,
    required totalAttempts,
    required averageGrade,
    required highestGrade,
    required climbs,
  }) {
    _id = id;
    _dateTime = dateTime;
    _climbsCompleted = climbsCompleted;
    _totalAttempts = totalAttempts;
    _averageGrade = averageGrade;
    _highestGrade = highestGrade;
    _climbs = climbs;
  }


  Sesh.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateTime = json['date_time'];
    _climbsCompleted = json['climbs_completed'];
    _totalAttempts = json['total_attempts'];
    _averageGrade = json['average_grade'];
    _highestGrade = json['highest_grade'];

    if (json['climbs'] != null) {
      _climbs = <Climb>[];
      json['climbs'].forEach((v) {
        _climbs?.add(Climb.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = _id;
    data['date_time'] = _dateTime;
    data['climbs_completed'] = _climbsCompleted;
    data['total_attempts'] = _totalAttempts;
    data['average_grade'] = _averageGrade;
    data['highest_grade'] = _highestGrade;

    if(_climbs != null){
      data['climbs'] = _climbs?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}