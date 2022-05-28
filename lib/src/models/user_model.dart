import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';

class User {
  String? _email;
  String? _firstName;
  String? _lastName;

  List<Sesh>? _seshes;
  List<Climb>? _climbs;

  List<Sesh>? get seshes => _seshes;
  List<Climb>? get climbs => _climbs;

  User({
    required email,
    required firstName,
    required lastName,
    required seshes,
    required climbs,
  }) {
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _seshes = seshes;
    _climbs = climbs;
  }


  User.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];

    if (json['sehes'] != null) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = _email;
    data['first_name'] = _firstName;
    data['last_name'] = _lastName;

    if(_seshes != null){
      data['seshes'] = _seshes?.map((v) => v.toJson()).toList();
    }

    if(_climbs != null){
      data['climbs'] = _climbs?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}