import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SeshRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<UserModel?> createUser(
      {required String? uid,
      required String? email,
      required String? firstName}) async {
    try {
      UserModel userModel =
          UserModel(email: email, firstName: firstName, userId: uid);
      await users.doc(uid).set(userModel.toJson());
      return userModel;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //Should only be creating user on first signup
  // Future<User?> createUser(
  //     {required String? name,
  //     required String? email,
  //     required String? uuid}) async {
  //   try {
  //     var firebaseUser = FirebaseAuth.instance.currentUser;
  //     CollectionReference users =
  //         FirebaseFirestore.instance.collection('users');
  //     await users.doc(firebaseUser?.uid).set({
  //       'first_name': name,
  //       'email': email,
  //       'user_id': uuid,
  //       'seshes': [{}],
  //       'climbs': [{}],
  //     });
  //     return firebaseUser;
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  Future<UserModel> getUser({
    required String? userId,
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
    try {
      await users.doc(userId).update(userModel.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateSesh() async {}

  Future<void> deleteSesh() async {}

  Future<void> createClimb() async {}

  Future<void> updateClimb() async {}

  Future<void> deleteClimb() async {}
}
