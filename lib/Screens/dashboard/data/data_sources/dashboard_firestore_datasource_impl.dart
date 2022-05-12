import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';

import 'dashboard_firestore_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardFirestoreDatasourceImplementation
    implements DashboardFirestoreDatasource {
  final _fireStore = FirebaseFirestore.instance;
  final docFal = FirebaseFirestore.instance.collection("fallar");
  final docUser = FirebaseFirestore.instance.collection("users");

  @override
  Future<List<FortuneTells>> getMyFortunesTell(String userId) async {
    final doc = await docFal.get();
    final List<FortuneTells> fortuneDoc = [];
    for (final element in doc.docs) {
      FortuneTells fortuneTellsFrom = FortuneTells.fromJson(element.data());
      fortuneTellsFrom.fortuneId=element.id;
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
     final addedDoc= await docFal.add(fortuneTells.toJson());
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
      final userDoc =
      await _fireStore.collection("users").doc(fortuneTells.userId).get();
      final userModel = AppUserModel.fromJson(userDoc.data()!);
      await _fireStore.collection("users").doc(fortuneTells.userId).set(
        AppUserModel(
            uid: userModel.uid,
            name: userModel.name,
            email: userModel.email,
            sex: userModel.sex,
            birthDate: userModel.birthDate,
            fTellId: userFortuneId)
            .toJson(),
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

      final userDoc =
      await _fireStore.collection("users").doc(fortuneTells.userId).get();
      final userModel = AppUserModel.fromJson(userDoc.data()!);
      await _fireStore.collection("users").doc(fortuneTells.userId).set(
        AppUserModel(
            uid: userModel.uid,
            name: userModel.name,
            email: userModel.email,
            sex: userModel.sex,
            birthDate: userModel.birthDate,
            fTellId: fortuneDocId)
            .toJson(),
      );
      return fortuneDoc;
    } catch (e) {
      throw e.toString();
    }
  }
}
