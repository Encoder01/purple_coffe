import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/entities/LoginModel.dart';
import '../models/user.dart';
import 'authentication_datasource.dart';

class IAuthenticationDatasourceImplementation
    implements IAuthenticationDatasource {
  final _firebaseAuth = FirebaseAuth.instance;
  final docUser = FirebaseFirestore.instance.collection("users");

  /* @override
  Future<AppUserModel> signInWithEmailPassword(LoginModel login) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailLink(
          email: login.email, emailLink: login.emailLink!);
      final userModel = await docUser.doc(user.user!.uid).get();
      return AppUserModel(
        uid: user.user!.uid,
        name: userModel.data()!["ad_soyad"] as String,
        lastName: "",
        birthDate: DateTime.now(),
        fTellId: userModel.data()!["fallari"] as List<String>,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }*/

  /* @override
  Future<void> createUserEmailPassword(LoginModel login) async {
    try {
      await _firebaseAuth.sendSignInLinkToEmail(
          email: "jungarkagan@gmail.com",
          actionCodeSettings: ActionCodeSettings(
            url: "https://purplecoffe.page.link/mVFa",
            androidMinimumVersion: "21",
            handleCodeInApp: true,
            androidInstallApp: false,
            androidPackageName: kPackageId,
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw Exception('The email is invalid.');
      } else {
        throw Exception(e.code);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }*/
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
              birthDate: DateTime.now(),
              fTellId: [""],
            ).toJson(),
          );
      final userData = await docUser.doc(user.user!.uid).get();
      return AppUserModel.fromJson(userData.data()!);
    } catch (e) {
      print(e);
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
      print(e);
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
          birthDate: DateTime.now(),
          fTellId: [""],
        ).toJson(),
      );
      final userData = await docUser.doc(user.user!.uid).get();
      return AppUserModel.fromJson(userData.data()!);
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
