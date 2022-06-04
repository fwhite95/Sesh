class Climb {
  int? _climbId;
  int? _attempts;
  int? _grade;
  bool? _completed;
  String? _note;

  Climb({
    int? climbId,
    int? attempts,
    int?grade,
    bool? completed,
    String? note,
  }) {
    _climbId = climbId;
    _attempts = attempts;
    _grade = grade;
    _completed = completed;
    _note = note;
  }

  Climb.fromJson(Map<String, dynamic> json) {
    _climbId = json['climb_id'];
    _attempts = json['attempts'];
    _grade = json['grade'];
    _completed = json['completed'];
    _note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['climb_id'] = _climbId;
    data['attempts'] = _attempts;
    data['grade'] = _grade;
    data['completed'] = _completed;
    data['note'] = _note;

    return data;
  }
}
