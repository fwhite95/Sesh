import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';
import 'package:climbing_sessions/src/models/user_stats_model.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.email,
    required this.firstName,
    required this.userId,
    required this.seshes,
    this.userStats,
  });

  final String? email;
  final String? firstName;
  final String? userId;

  final List<Sesh>? seshes;
  final UserStatsModel? userStats;

  static UserModel fromJson(Map<String, dynamic>? json) {
    List<Sesh> seshes = [];

    if (json?['seshes'] != null) {
      seshes = <Sesh>[];
      json?['seshes'].forEach((v) {
        seshes.add(Sesh.fromJson(v));
      });
    }

    return UserModel(
      email: json?['email'],
      firstName: json?['first_name'],
      userId: json?['user_id'],
      seshes: seshes,
      userStats: json?['user_stats'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['first_name'] = firstName;
    data['user_id'] = userId;
    data['user_stats'] = userStats;

    if (seshes != null) {
      data['seshes'] = seshes?.map((v) => v.toJson()).toList();
    }

    return data;
  }

  /// Empty user which represents an unauthenticated user
  static const empty =
      UserModel(email: '', firstName: '', userId: '123', seshes: []);

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == UserModel.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [email, firstName, userId, seshes, userStats];
}
