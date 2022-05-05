import 'firestore_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FirestoreDatasourceImplementation implements FirestoreDatasource{
  final _fireStore= FirebaseFirestore.instance;
  @override
  Future<void> addUser(String adSoyad,String dateTime,String userId) {
    _fireStore.collection("users").doc(userId).set({
      "ad_soyad":adSoyad,
      "d.tarihi":dateTime,
      "fallari":["asfasf"],
    });
    throw UnimplementedError();
  }

  @override
  Future<void> getMyFortunesTell() {
    throw UnimplementedError();
  }

  @override
  Future<void> sendFortuneTell() {
    throw UnimplementedError();
  }

}
