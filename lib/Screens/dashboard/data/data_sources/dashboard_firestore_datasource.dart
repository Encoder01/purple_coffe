import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';

abstract class DashboardFirestoreDatasource {
  Future<void> addUser(AppUserModel userModel);

  Future<void> addFortuneTell(FortuneTells fortuneTells);
  Future<List<FortuneTells>> getMyFortunesTell(List<String> fortuneIds);
}
