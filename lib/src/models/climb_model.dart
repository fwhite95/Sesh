import 'package:equatable/equatable.dart';

class Climb extends Equatable {
  const Climb({
    this.climbId = 1,
    this.attempts = 1,
    this.grade = '',
    this.completed = false,
    this.note = '',
  });

  final int? climbId;
  final int? attempts;
  final String? grade;
  final bool? completed;
  final String? note;

  static Climb fromJson(Map<String, dynamic> json) {
    return Climb(
      climbId: json['climb_id'],
      attempts: json['attempts'],
      grade: json['grade'],
      completed: json['completed'],
      note: json['note'],
    );
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

  @override
  List<Object?> get props => [climbId, attempts, grade, completed, note];
}
