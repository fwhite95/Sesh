import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Sesh extends Equatable{
  const Sesh({
    required this.id,
    this.dateTime,
    required this.seshLength,
    required this.climbs,
  });

  final String? id;
  final DateTime? dateTime;
  final String? seshLength;
  final List<Climb>? climbs;

  static Sesh fromJson(Map<String, dynamic> json) {
    List<Climb> climbs = [];

    if (json['climbs'] != null) {
      json['climbs'].forEach((v) {
        climbs.add(Climb.fromJson(v));
      });
    }

    return Sesh(
        id: json['id'],
        //dateTime: (json['date_time'] as Timestamp).toDate(),
        seshLength: json['sesh_length'],
        climbs: climbs,
        );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['date_time'] = dateTime;
    data['sesh_length'] = seshLength;

    if (climbs != null) {
      data['climbs'] = climbs?.map((v) => v.toJson()).toList();
    }

    return data;
  }

  /// Empty sesh model for when a new sesh is started
  static const empty = Sesh(id: '', seshLength: '', climbs: []);

  @override
  List<Object?> get props => [id, dateTime, seshLength, climbs];
}
