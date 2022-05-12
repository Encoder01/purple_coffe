import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
abstract class DashboardFirestoreDatasource {
  Future<List<FortuneTells>> addFortuneTell(FortuneTells fortuneTells);
  Future<List<FortuneTells>> setFortuneTell(FortuneTells fortuneTells);
  Future<List<FortuneTells>> getMyFortunesTell(String userId);
}
