import 'dart:convert';

import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SeshRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> createSesh() async {}

  Future<UserModel> getUser({
    required String userId,
  }) async {
    try {
      DocumentSnapshot snapshot = await users.doc(userId).get();
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      UserModel userModel = UserModel.fromJson(data);
      return userModel;
    } catch (e) {
      print(e.toString());
    }
    
    throw Error();
  }

  Future<void> updateUser({
    required UserModel userModel,
    required String userId,
  }) async {
    try{
      await users.doc(userId).update(userModel.toJson());
    }catch(e) {
      print(e.toString());
    }
  }

  Future<void> updateSesh() async {}

  Future<void> deleteSesh() async {}

  Future<void> createClimb() async {}

  Future<void> updateClimb() async {}

  Future<void> deleteClimb() async {}
}
