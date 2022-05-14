import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
abstract class DashboardFirestoreDatasource {
  Future<List<FortuneTells>> addFortuneTell(FortuneTells fortuneTells);
  Future<List<FortuneTells>> setFortuneTell(FortuneTells fortuneTells);
  Future<AppUserModel> setUserInfo(AppUserModel updateUser);
  Future<AppUserModel> getUserInfo(String userId);
  Future<List<FortuneTells>> getMyFortunesTell(String userId);
}
