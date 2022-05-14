import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:purple_coffe/config/env/env.dart';
import 'package:purple_coffe/config/themes/themes.dart';

import 'app_constants.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}

String formatDate(DateTime date) {
  DateTime now = date;

  String convertedDateTime =
      "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
  return convertedDateTime;
}

Future<void> loadSound(String soundPath) async {
  kSoundId = await rootBundle.load(soundPath).then((ByteData soundData) {
    return pool.load(soundData);
  });
}

Future<ImageSource?> dialogCameraOrGallery(BuildContext context) async {
  ImageSource? source;
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      content: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: Themes.gradientColors)),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                source = ImageSource.camera;
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * .5, 40),
                primary: Colors.purple,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Ionicons.camera),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Camera"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                source = ImageSource.gallery;
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * .5, 40),
                primary: Colors.purple,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Ionicons.albums),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Gallery"),
                ],
              ),
            ),
          ],
        ),
      ),
      contentPadding: EdgeInsets.zero,
    ),
  );
  return source;
}

Future<bool> busyDialog(BuildContext context) async {
  bool sendFortune = false;
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: Themes.gradientColors)),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Yoğunluk nedeniyle falınıza ancak ${AppEnvironment.appEnv.busyFortuneTime} saat sonra bakılabilecektir. Onaylıyor musunuz?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Themes.mainColor,
                fontSize: 18
              ),
            ),
            TextButton(
              onPressed: () {
                sendFortune = true;
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * .5, 40),
                primary: Colors.purple,
              ),
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                sendFortune = false;
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * .5, 40),
                primary: Colors.purple,
              ),
              child: Text("No"),
            ),
          ],
        ),
      ),
    ),
  );
  return sendFortune;
}
