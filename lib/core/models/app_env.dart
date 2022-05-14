class AppEnv{
  int? dailyFortune;
  int? fortuneTime;
  int? helpChar;
  int? busyFortuneTime;
  int? readedDailyFortune;
  AppEnv({
    required this.dailyFortune,
    required this.busyFortuneTime,
    required this.fortuneTime,
    required this.helpChar,
    required this.readedDailyFortune,
});
  AppEnv.fromJson(Map<String, dynamic> json) {
    dailyFortune = json['daily_fortune'] as int;
    busyFortuneTime = json['busy_fortune_time'] as int;
    fortuneTime = json['fortune_time'] as int;
    helpChar = json['help_char'] as int;
    readedDailyFortune = json['readed_daily_fortune'] as int;
  }
  factory AppEnv.empty() {
    return AppEnv(
      busyFortuneTime: 96,
      dailyFortune: 8,
      fortuneTime: 48,
      helpChar: 300,
      readedDailyFortune: 0
    );
  }
}