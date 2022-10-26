import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.email,
    required this.firstName,
    required this.userId,
    this.seshes,
    this.climbs,
  });

  final String? email;
  final String? firstName;
  final String? userId;

  final List<Sesh>? seshes;
  final List<Climb>? climbs;

  // List<Sesh>? get seshes => _seshes;
  // List<Climb>? get climbs => _climbs;

  // String? get email => _email;
  // String? get firstName => _firstName;
  // String? get userid => _userId;

  // UserModel.fromJson(Map<String, dynamic> json) {
  //   email = json['email'];
  //   firstName = json['first_name'];
  //   userId = json['user_id'];

  //   if (json['seshes'] != null) {
  //     _seshes = <Sesh>[];
  //     json['seshes'].forEach((v) {
  //       _seshes?.add(Sesh.fromJson(v));
  //     });
  //   }

  //   if (json['climbs'] != null) {
  //     _climbs = <Climb>[];
  //     json['climbs'].forEach((v) {
  //       _climbs?.add(Climb.fromJson(v));
  //     });
  //   }

  // }

  static UserModel fromJson(Map<String, dynamic>? json) {
    List<Sesh> seshes = [];
    List<Climb> climbs = [];

    if (json?['seshes'] != null) {
      seshes = <Sesh>[];
      json?['seshes'].forEach((v) {
        seshes.add(Sesh.fromJson(v));
      });
    }

    if (json?['climbs'] != null) {
      climbs = <Climb>[];
      json?['climbs'].forEach((v) {
        climbs.add(Climb.fromJson(v));
      });
    }

    return UserModel(
      email: json?['email'],
      firstName: json?['first_name'],
      userId: json?['user_id'],
      climbs: climbs,
      seshes: seshes,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['first_name'] = firstName;
    data['user_id'] = userId;

    if (seshes != null) {
      data['seshes'] = seshes?.map((v) => v.toJson()).toList();
    }

    if (climbs != null) {
      data['climbs'] = climbs?.map((v) => v.toJson()).toList();
    }

    return data;
  }

  /// Empty user which represents an unauthenticated user
  static const empty = UserModel(email: '', firstName: '', userId: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == UserModel.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [email, firstName, userId, seshes, climbs];
}
