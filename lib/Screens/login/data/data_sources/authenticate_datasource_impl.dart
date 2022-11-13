import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:purple_coffe/core/constants/functions.dart';
import 'package:purple_coffe/core/error/auth_error.dart';

import '../../domain/entities/LoginModel.dart';
import '../models/user.dart';
import 'authentication_datasource.dart';

class IAuthenticationDatasourceImplementation
    implements IAuthenticationDatasource {
  final _firebaseAuth = FirebaseAuth.instance;
  final docUser = FirebaseFirestore.instance.collection("users");

  @override
  Future<AppUserModel> createUserEmailPassword(LoginModel login) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: login.email, password: login.password!);
      await docUser.doc(user.user!.uid).set(
            AppUserModel(
              uid: user.user!.uid,
              name: user.user!.displayName ?? "adsız_kullanıcı",
              email: user.user!.email ?? login.email,
              sex: "unknown",
              birthDate: "dd/mm/YY",
              fTellId: const [""],
              availableCredit: const [{'credit_count': 0, 'credit_id': '0'}],
            ).toJson(),
          );
      final userData = await docUser.doc(user.user!.uid).get();
      return AppUserModel.fromJson(userData.data()!);
    } catch (e) {
      busyDialog(AuthError().handleError(e),true);
      throw Exception(e.toString());
    }
  }

  @override
  Future<AppUserModel> signInWithEmailPassword(LoginModel login) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
          email: login.email, password: login.password!);
      final userData = await docUser.doc(user.user!.uid).get();
      return AppUserModel.fromJson(userData.data()!);
    } catch (e) {
      busyDialog(AuthError().handleError(e),true);
      throw Exception(e.toString());
    }
  }

  @override
  Future<AppUserModel?> checkAuthentication() async {
    try {
      if (_firebaseAuth.currentUser != null) {
        final User currentUser = _firebaseAuth.currentUser!;
        final userData = await docUser.doc(currentUser.uid).get();
        return AppUserModel.fromJson(userData.data()!);
      }
    } catch (e) {
      busyDialog(AuthError().handleError(e),true);
      throw Exception(e.toString());
    }
    return null;
  }

  @override
  Future<AppUserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final user = await _firebaseAuth.signInWithCredential(credential);
      await docUser.doc(user.user!.uid).set(
        AppUserModel(
          uid: user.user!.uid,
          name: user.user!.displayName ?? "adsız_kullanıcı",
          email: user.user!.email!,
          sex: "unknown",
          birthDate: "dd/mm/YY",
          fTellId: const [""],
          availableCredit:const [ {'credit_count': 0, 'credit_id': '0'}]
        ).toJson(),
      );
      final userData = await docUser.doc(user.user!.uid).get();
      return AppUserModel.fromJson(userData.data()!);
    } catch (e) {
      busyDialog(AuthError().handleError(e),true);
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      busyDialog(AuthError().handleError(e),true);
      throw Exception(e);
    }
  }

  @override
  Future<bool> resetPasswordMail(String mail) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: mail,);
      return true;
    } catch (e) {
      busyDialog(AuthError().handleError(e), true);

      throw Exception(e);
    }
  }
}
