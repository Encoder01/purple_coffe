import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/entities/LoginModel.dart';
import '../models/user.dart';
import 'authentication_datasource.dart';

class IAuthenticationDatasourceImplementation implements IAuthenticationDatasource {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUserModel> signIn(LoginModel login) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: login.username,
        password: login.password,
      );
      //todo veritabaınından uid ile çekilecek user.
      return AppUserModel(
        uid: result.user!.uid,
        name: result.user!.displayName ?? "null",
        lastName: "",
        birthDate: DateTime.now(),
        fTellId: const [],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AppUserModel> checkAuthentication() async {
    AppUserModel userModel = AppUserModel.empty();
    try {
      if (_firebaseAuth.currentUser != null) {
        final User currentUser = _firebaseAuth.currentUser!;
        userModel = AppUserModel(
          uid: currentUser.uid,
          name: currentUser.displayName ?? '',
          lastName: "",
          birthDate: DateTime.now(),
          fTellId: const [""],
        );
      }
    } catch (_) {}
    return userModel;
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
      final result = await _firebaseAuth.signInWithCredential(credential);
      return AppUserModel(
        uid: result.user!.uid,
        name: result.user!.displayName!,
        lastName: "",
        birthDate: DateTime.now(),
        fTellId: const [],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AppUserModel> signUp(LoginModel login) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: login.username,
        password: login.password,
      );
      return AppUserModel(
        uid: result.user!.uid,
        name: result.user!.displayName!,
        lastName: "",
        birthDate: DateTime.now(),
        fTellId: const [],
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      } else {
        throw Exception(e.code);
      }
    } catch (e) {
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
