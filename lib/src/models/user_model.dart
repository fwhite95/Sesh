import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';

class UserModel {
  String? _email;
  String? _firstName;

  List<Sesh>? _seshes;
  List<Climb>? _climbs;

  List<Sesh>? get seshes => _seshes;
  List<Climb>? get climbs => _climbs;

  String? get email => _email;
  String? get firstName => _firstName;

  UserModel({
    required email,
    required firstName,
    required seshes,
    required climbs,
  }) {
    _email = email;
    _firstName = firstName;
    _seshes = seshes;
    _climbs = climbs;
  }


  UserModel.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _firstName = json['first_name'];

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

    if(_seshes != null){
      data['seshes'] = _seshes?.map((v) => v.toJson()).toList();
    }

    if(_climbs != null){
      data['climbs'] = _climbs?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}