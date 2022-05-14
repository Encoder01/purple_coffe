import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:purple_coffe/core/models/app_env.dart';
final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore fireStore = FirebaseFirestore.instance;
final docFal = fireStore.collection("fallar");
final docUser = FirebaseFirestore.instance.collection("users");
final docEnv = FirebaseFirestore.instance.collection("falci");
Future<AppEnv?> getEnvironment()async{
  final doc = await docEnv.doc("ZmbSG2rsYqohKtNFA2vQ").get();
  AppEnv appEnv = AppEnv.fromJson(doc.data()!);
  return appEnv;
}