import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sesh {
  String? _id;
  DateTime? _dateTime;
  String? _seshLength;

  List<Climb>? _climbs;
  List<Climb>? get climbs => _climbs;

  String? get id => _id;
  DateTime? get dateTime => _dateTime;
  String? get seshTIme => _seshLength;

  Sesh({
    String? id,
    DateTime? dateTime,
    String? seshLength,
    List<Climb>? climbs,
  }) {
    _id = id;
    _dateTime = dateTime;
    _seshLength = seshLength;
    _climbs = climbs;
  }

  Sesh.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateTime = (json['date_time'] as Timestamp).toDate();
    _seshLength = json['sesh_length'];

    if (json['climbs'] != null) {
      _climbs = <Climb>[];
      json['climbs'].forEach((v) {
        _climbs?.add(Climb.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = _id;
    data['date_time'] = _dateTime;
    data['sesh_length'] = _seshLength;

    if (_climbs != null) {
      data['climbs'] = _climbs?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
