import 'dart:convert';

import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';

import 'dashboard_firestore_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardFirestoreDatasourceImplementation
    implements DashboardFirestoreDatasource {
  final _fireStore = FirebaseFirestore.instance;
  final docFal = FirebaseFirestore.instance.collection("fallar");
  final docUser = FirebaseFirestore.instance.collection("users");

  @override
  Future<void> addUser(String adSoyad, String dateTime, String userId) async {
    await docUser.doc(userId).set({
      "ad_soyad": adSoyad,
      "d.tarihi": dateTime,
      "fallari": ["asfasf"],
    });
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
  Future<void> addFortuneTell(
      String userId, List<String> flatCup, List<String> inCup) async {
    await docFal.add({
      "user_id": userId,
      "fal_yorumu": "",
      "flat_cup": flatCup,
      "in_cup": inCup,
      "is_done": false,
    });
    final doc = await docFal.get();
    final List<String> fDocId = [];
    for (final element in doc.docs) {
      fDocId.add(element.id);
    }
    await _fireStore.collection("users").doc(userId).set({
      "ad_soyad": "adSoyad",
      "d.tarihi": "dateTime",
      "fallari": fDocId,
    });
    throw UnimplementedError();
  }
}
