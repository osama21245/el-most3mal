import 'package:elmostaml/core/constants/constants.dart';
import 'package:elmostaml/core/faliure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../core/constants/firebase_constants.dart';
import '../../../models/user_model.dart';
import '../../../core/type_def.dart';

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _auth = auth,
        _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future<Either> signinWithEmailAndPassword(String email, String password,
      String username, String phone, String profilePic) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel;
      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
          phone: phone,
          isonline: false,
          name: username,
          profilePic: profilePic,
          uid: userCredential.user!.uid,
          isAuthanticated: true,
        );
        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
      } else {
        return left(Get.defaultDialog(
            title: "Warning", middleText: "Phone or Email is alredy Exist"));
      }
      return right(userModel);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<UserModel> signInAsGuest(String phone) async {
    try {
      var userCredential = await _auth.signInAnonymously();

      UserModel userModel = UserModel(
        phone: phone,
        name: 'Guest',
        profilePic: Constants.avatarDefault,
        uid: userCredential.user!.uid,
        isAuthanticated: false,
        isonline: false,
      );

      await _users.doc(userCredential.user!.uid).set(userModel.toMap());

      return right(userModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either> restPassword(String email) async {
    try {
      return right(_auth.sendPasswordResetEmail(
        email: email,
      ));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either> logIn(String email, String password) async {
    try {
      return right(await _auth.signInWithEmailAndPassword(
          email: email, password: password));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<UserModel> getUserData(String uid) async {
    DocumentSnapshot doc = await _users.doc(uid).get();

    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  }

  void logOut() async {
    await _auth.signOut();
  }
}
