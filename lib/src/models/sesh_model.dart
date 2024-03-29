import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sesh {
  int? _id;
  DateTime? _dateTime;
  int? _climbsCompleted;
  int? _totalAttempts;
  int? _averageGrade;
  int? _highestGrade;

  List<Climb>? _climbs;
  List<Climb>? get climbs => _climbs;

  DateTime? get dateTime => _dateTime;
  int? get climbsCompleted => _climbsCompleted;
  int? get totalAttempts => _totalAttempts;
  int? get averageGrade => _averageGrade;
  int? get highestGrade => _highestGrade;
  

  Sesh({
    int? id,
    DateTime? dateTime,
    int? climbsCompleted,
    int? totalAttempts,
    int? averageGrade,
    int? highestGrade,
    List<Climb>? climbs,
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
    _dateTime = (json['date_time'] as Timestamp).toDate();
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

    if (_climbs != null) {
      data['climbs'] = _climbs?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
