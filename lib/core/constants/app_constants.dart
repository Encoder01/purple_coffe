// App
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:soundpool/soundpool.dart';

const String kAppTitle = "Purple Coffe";

// Routes
const String kInitialRoute = "/";
const String kLoginScreenRoute = "/LoginScreen";
const String kHomeScreenRoute = "/HomeScreen";
const String kProjectUrl = "https://alwaystest-6b017.firebaseapp.com";
const String kPackageId = "com.ttan.purplecoffe.purple_coffe";
const String koneSignalKey = "11dd0b75-1cce-40f0-a4b4-c08a08fb4a42";


const AndroidNotificationChannel kChannel = AndroidNotificationChannel(
  'purple_coffe_bildirim_kanalı', // id
  'Yüksek öncelikli bildirim', // title

  importance: Importance.high,
);
int? kSoundId = 0;
Soundpool pool = Soundpool.fromOptions();

// Messages
const String kUnexpectedError = "Beklenmeyen Bir Hata Oluştu";
