abstract class FirestoreDatasource {
  Future<void> addUser(String adSoyad,String dateTime,String userId);

  Future<void> sendFortuneTell();

  Future<void> getMyFortunesTell();
}
