import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  UserModel({
    required email,
    required firstName,
    required userId,
  }) {
    _email = email;
    _firstName = firstName;
    _userId = userid;
    _seshes = [];
    _climbs = [];
  }

  String? _email;
  String? _firstName;
  String? _userId;

  List<Sesh>? _seshes;
  List<Climb>? _climbs;

  List<Sesh>? get seshes => _seshes;
  List<Climb>? get climbs => _climbs;

  String? get email => _email;
  String? get firstName => _firstName;
  String? get userid => _userId;

  UserModel.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _firstName = json['first_name'];
    _userId = json['user_id'];

    if (json['seshes'] != null) {
      _seshes = <Sesh>[];
      json['seshes'].forEach((v) {
        _seshes?.add(Sesh.fromJson(v));
      });
    }

    if (json['climbs'] != null) {
      _climbs = <Climb>[];
      json['climbs'].forEach((v) {
        _climbs?.add(Climb.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = _email;
    data['first_name'] = _firstName;
    data['user_id'] = _userId;

    if (_seshes != null) {
      data['seshes'] = _seshes?.map((v) => v.toJson()).toList();
    }

    if (_climbs != null) {
      data['climbs'] = _climbs?.map((v) => v.toJson()).toList();
    }

    return data;
  }

  @override
  List<Object?> get props => [];
}
