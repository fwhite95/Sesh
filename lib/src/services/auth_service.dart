import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Stream<UserModel> retrieveCurrentUser() {
  //   // return auth.authStateChanges().map((User? user) {
  //   //   if (user != null) {
  //   //     return UserModel(email: email, firstName: firstName, seshes: seshes, climbs: climbs);
  //   //   }
  //   // });
  // }


}