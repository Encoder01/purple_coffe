import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'package:purple_coffe/core/constants/firebase_constants.dart';
import 'dashboard_firestore_datasource.dart';

class DashboardFirestoreDatasourceImplementation implements DashboardFirestoreDatasource {
  @override
  Future<List<FortuneTells>> getMyFortunesTell(String userId) async {
    final doc = await docFal.get();
    final List<FortuneTells> fortuneDoc = [];
    for (final element in doc.docs) {
      FortuneTells fortuneTellsFrom = FortuneTells.fromJson(element.data());
      fortuneTellsFrom.fortuneId = element.id;
      if (userId == fortuneTellsFrom.userId) {
        fortuneDoc.add(fortuneTellsFrom);
        print(fortuneDoc.first.fortuneId);
      }
    }
    return fortuneDoc;
  }

  @override
  Future<List<FortuneTells>> addFortuneTell(FortuneTells fortuneTells) async {
    try {
      final addedDoc = await docFal.add(fortuneTells.toJson());
      await addedDoc.update({"fortune_id": addedDoc.id});
      final doc = await docFal.get();
      final List<FortuneTells> fortuneDoc = [];
      final List<String> userFortuneId = [];
      for (final element in doc.docs) {
        FortuneTells fortuneTellsFrom = FortuneTells.fromJson(element.data());
        fortuneTellsFrom.fortuneId = element.id;
        if (fortuneTells.userId == fortuneTellsFrom.userId) {
          fortuneDoc.add(fortuneTellsFrom);
          userFortuneId.add(fortuneTellsFrom.fortuneId!);
        }
      }
      final userDoc = await fireStore.collection("users").doc(fortuneTells.userId).get();
      final userModel = AppUserModel.fromJson(userDoc.data()!);
      await fireStore.collection("users").doc(fortuneTells.userId).set(
            AppUserModel(
              uid: userModel.uid,
              name: userModel.name,
              email: userModel.email,
              sex: userModel.sex,
              birthDate: userModel.birthDate,
              fTellId: userFortuneId,
              availableCredit: userModel.availableCredit,
            ).toJson(),
          );
      return fortuneDoc;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FortuneTells>> setFortuneTell(FortuneTells fortuneTells) async {
    try {
      await docFal.doc(fortuneTells.fortuneId).set(fortuneTells.toJson());
      final doc = await docFal.get();
      final List<FortuneTells> fortuneDoc = [];
      final List<String> fortuneDocId = [];
      for (final element in doc.docs) {
        FortuneTells fortuneTellsFrom = FortuneTells.fromJson(element.data());
        fortuneTellsFrom.fortuneId = element.id;
        if (fortuneTells.userId == fortuneTellsFrom.userId) {
          fortuneDoc.add(fortuneTellsFrom);
          fortuneDocId.add(fortuneTellsFrom.fortuneId!);
        }
      }

      final userDoc = await fireStore.collection("users").doc(fortuneTells.userId).get();
      final userModel = AppUserModel.fromJson(userDoc.data()!);
      await fireStore.collection("users").doc(fortuneTells.userId).set(
            AppUserModel(
              uid: userModel.uid,
              name: userModel.name,
              email: userModel.email,
              sex: userModel.sex,
              birthDate: userModel.birthDate,
              fTellId: fortuneDocId,
              availableCredit: userModel.availableCredit,
            ).toJson(),
          );
      return fortuneDoc;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<AppUserModel> setUserInfo(AppUserModel updateUser) async {
    try {
      await docUser.doc(updateUser.uid).set(updateUser.toJson());
      final userData = await docUser.doc(updateUser.uid).get();
      return AppUserModel.fromJson(userData.data()!);
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<AppUserModel> getUserInfo(String userId) async {
    try {
      final userData = await docUser.doc(userId).get();
      return AppUserModel.fromJson(userData.data()!);
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<FortuneTells>> deleteFortuneTell(FortuneTells fortuneId) async {
    try {
      await docFal.doc(fortuneId.fortuneId).delete();
      final doc = await docFal.get();
      final List<FortuneTells> fortuneDoc = [];
      final List<String> fortuneDocId = [];
      for (final element in doc.docs) {
        FortuneTells fortuneTellsFrom = FortuneTells.fromJson(element.data());
        fortuneTellsFrom.fortuneId = element.id;
        if (fortuneId.userId == fortuneTellsFrom.userId) {
          fortuneDoc.add(fortuneTellsFrom);
          fortuneDocId.add(fortuneTellsFrom.fortuneId!);
        }
      }

      final userDoc = await fireStore.collection("users").doc(fortuneId.userId).get();
      final userModel = AppUserModel.fromJson(userDoc.data()!);
      await fireStore.collection("users").doc(fortuneId.userId).set(
            AppUserModel(
              uid: userModel.uid,
              name: userModel.name,
              email: userModel.email,
              sex: userModel.sex,
              birthDate: userModel.birthDate,
              availableCredit: userModel.availableCredit,
              fTellId: fortuneDocId,
            ).toJson(),
          );
      return fortuneDoc;
    } catch (e) {
      throw e.toString();
    }
  }
}
