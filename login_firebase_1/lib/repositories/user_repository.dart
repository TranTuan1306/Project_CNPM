import 'package:login_firebase_1/models/user_models/user_model.dart';
import 'package:login_firebase_1/models/user_register_models/user_register_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUp(UserRegisterModel userRegisterModel) async {
    return await _firebaseAuth
        .createUserWithEmailAndPassword(
      email: userRegisterModel.email,
      password: userRegisterModel.password,
    )
        .then((currentUser) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser.user.uid)
          .set(
        {
          "uid": currentUser.user.uid,
          "user_name": userRegisterModel.name,
          "email": userRegisterModel.email
        },
      );
    });
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }

  Future<UserModel> getUser() async {
    final user = _firebaseAuth.currentUser;
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();

    return UserModel.fromJson(userSnapshot.data());
  }
}
