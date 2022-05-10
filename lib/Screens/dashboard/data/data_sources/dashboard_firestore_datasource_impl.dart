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
  Future<void> addUser(AppUserModel userModel) async {
    await docUser.doc(userModel.uid).set(userModel.toJson());
    throw UnimplementedError();
  }

  @override
  Future<List<FortuneTells>> getMyFortunesTell(List<String> fortuneIds) async {
    final List<FortuneTells> fDocId = [];
    for (final element in fortuneIds) {
      final docs = await docFal.doc(element).get();
      fDocId.add(FortuneTells.fromJson(docs.data()!));
    }
    print(fDocId.first.userId);
    return fDocId;
  }

  @override
  Future<void> addFortuneTell(FortuneTells fortuneTells) async {
    await docFal.add(fortuneTells.toJson());
    final doc = await docFal.get();
    final List<String> fDocId = [];
    for (final element in doc.docs) {
    final fortuneTellsFrom=  FortuneTells.fromJson(element.data());
    if(fortuneTells.userId==fortuneTellsFrom.userId){
      fDocId.add(element.id);
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
                  fTellId: fDocId)
              .toJson(),
        );
    throw UnimplementedError();
  }
}
