import 'package:equatable/equatable.dart';

class SeshStatsModel extends Equatable {
  const SeshStatsModel({
    this.totalClimbs,
    this.highestGrade,
    this.averageGrade,
    this.seshLength,
    this.totalAttempts,
    this.climbsCompleted,
    this.completedAttemptsRatio,
  });

  final String? totalClimbs;
  final String? highestGrade;
  final String? averageGrade;
  final String? seshLength;
  final String? totalAttempts;
  final String? climbsCompleted;
  final String? completedAttemptsRatio;

  static SeshStatsModel fromJson(Map<String, dynamic>? json) {
    return SeshStatsModel(
      totalClimbs: json?['total_climbs'],
      highestGrade: json?['highest_grade'],
      averageGrade: json?['average_grade'],
      seshLength: json?['sesh_length'],
      totalAttempts: json?['total_attempts'],
      climbsCompleted: json?['climbs_completed'],
      completedAttemptsRatio: json?['completed_attempts_ratio'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['total_climbs'] = totalClimbs;
    data['highest_grade'] = highestGrade;
    data['average_grade'] = averageGrade;
    data['sesh_length'] = seshLength;
    data['total_attempts'] = totalAttempts;
    data['climbs_completed'] = climbsCompleted;
    data['completed_attempts_ratio'] = completedAttemptsRatio;

    return data;
  }

  @override
  List<Object?> get props => [
        totalClimbs,
        highestGrade,
        averageGrade,
        seshLength,
        totalAttempts,
        climbsCompleted,
        completedAttemptsRatio
      ];
}
