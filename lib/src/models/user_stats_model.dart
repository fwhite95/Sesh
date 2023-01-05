import 'package:equatable/equatable.dart';

class UserStatsModel extends Equatable {
  const UserStatsModel({
    this.totalClimbs,
    this.totalSeshLength,
    this.totalAttempts,
    this.totalGrade,
    this.totalSeshs,
    this.totalClimbsCompleted,
    this.highestGrade,
    this.averageGrade,
    this.averageSeshLength,
    this.averageTotalAttempts,
    this.averageCimbsCompleted,
    this.completedAttemptsRatio,
  });

  final String? totalClimbs;
  final String? totalSeshLength;
  final String? totalAttempts;
  final String? totalGrade;
  final String? totalSeshs;
  final String? totalClimbsCompleted;
  final String? highestGrade;

  final String? averageGrade;
  final String? averageSeshLength;
  final String? averageTotalAttempts;
  final String? averageCimbsCompleted;
  final String? completedAttemptsRatio;

  static UserStatsModel fromJson(Map<String, dynamic>? json) {
    return UserStatsModel(
      totalClimbs: json?['total_climbs'],
      totalSeshLength: json?['total_sesh_length'],
      totalAttempts: json?['total_attempts'],
      totalGrade: json?['total_grade'],
      totalSeshs: json?['total_seshes'],
      totalClimbsCompleted: json?['total_climbs_completed'],
      highestGrade: json?['highest_grade'],
      averageGrade: json?['average_grade'],
      averageSeshLength: json?['average_sesh_length'],
      averageTotalAttempts: json?['average_total_attempts'],
      averageCimbsCompleted: json?['average_climbs_completed'],
      completedAttemptsRatio: json?['completed_attempts_ratio'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['total_climbs'] = totalClimbs;
    data['total_sesh_length'] = totalSeshLength;
    data['total_attempts'] = totalAttempts;
    data['total_grade'] = totalGrade;
    data['total_seshes'] = totalSeshs;
    data['total_climbs_completed'] = totalClimbsCompleted;
    data['highest_grade'] = highestGrade;
    data['average_grade'] = averageGrade;
    data['average_sesh_length'] = averageSeshLength;
    data['average_total_attempts'] = averageTotalAttempts;
    data['average_climbs_completed'] = averageCimbsCompleted;
    data['completed_attempts_ratio'] = completedAttemptsRatio;

    return data;
  }

  @override
  List<Object?> get props => [
        totalClimbs,
        totalSeshLength,
        totalAttempts,
        totalGrade,
        totalSeshs,
        totalClimbsCompleted,
        highestGrade,
        averageGrade,
        averageSeshLength,
        averageTotalAttempts,
        averageCimbsCompleted,
        completedAttemptsRatio
      ];
}
