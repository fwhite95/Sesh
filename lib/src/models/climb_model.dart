class Climb {
  int? climbId;
  int? attempts;
  int? grade;
  bool? completed;
  String? note;

  Climb({
    int? climbId,
    int? attempts = 0,
    int?grade = 0,
    bool? completed = false,
    String? note,
  }) {
    this.climbId = climbId;
    this.attempts = attempts;
    this.grade = grade;
    this.completed = completed;
    this.note = note;
  }


  Climb.fromJson(Map<String, dynamic> json) {
    climbId = json['climb_id'];
    attempts = json['attempts'];
    grade = json['grade'];
    completed = json['completed'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['climb_id'] = climbId;
    data['attempts'] = attempts;
    data['grade'] = grade;
    data['completed'] = completed;
    data['note'] = note;

    return data;
  }
}
