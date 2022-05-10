import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';

abstract class DashboardFirestoreDatasource {
  Future<void> addUser(String adSoyad,String dateTime,String userId);

  Future<void> addFortuneTell(String userId,List<String> flatCup,List<String> inCup);
  Future<List<FortuneTells>> getMyFortunesTell(List<String> fortuneIds);
}
