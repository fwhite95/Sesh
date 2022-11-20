import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// A repository that handles all firebase user requests
class UserFbRepository {
  UserFbRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firebaseFirestore;

  /// Provides a [Stream] of the user
  Stream<UserModel> getUser(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((firestoreUser) {
      final UserModel user = UserModel.fromJson(firestoreUser.data());
      return user;
    });
  }

  /// Creates the firebase [UserModel]
  Future<bool> doesUserExist(UserModel user) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(user.userId)
          .get()
          .then((value) {
        print('USER REPO: ${value.exists}');
        return value.exists;
      });
      return false;
    } catch (e) {
      throw FirebaseException(
          plugin: 'createFirebaseUser', message: e.toString());
    }
  }

  Future<void> createFirebaseUser(UserModel user) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(user.userId)
          .set(user.toJson());
    } catch (e) {
      throw FirebaseException(
          plugin: 'createFirebaseUser', message: e.toString());
    }
  }

  /// Saves the [UserModel]
  Future<void> updateFirebaseUser(UserModel user) async {
    print('USER FROM REPO: $user');
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(user.userId)
          .update(user.toJson());
    } catch (e) {
      throw FirebaseException(
          plugin: 'updateFirebaseUser', message: e.toString());
    }
  }

  /// Deletes the [UserModel] with the given id
  Future<void> deleteFirebaseUser(UserModel user) async {
    try {
      await _firebaseFirestore.collection('users').doc(user.userId).delete();
    } catch (e) {
      throw FirebaseException(
          plugin: 'deleteFirebaseUser', message: e.toString());
    }
  }
}
