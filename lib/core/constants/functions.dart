import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:purple_coffe/config/themes/themes.dart';

import 'app_constants.dart';

void showSnackBar(String text) {
  final SnackBar snackBar = SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 2),
  );
  kSnackbarKey.currentState?.showSnackBar(snackBar);
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
      backgroundColor: Themes.gradientColors[2],
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                source = ImageSource.camera;
                Navigator.pop(_);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * .5, 40),
                primary: Themes.gradientColors.first,
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
                Navigator.pop(_);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * .5, 40),
                primary: Themes.gradientColors.first,
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
            TextButton(
              onPressed: () {
                source = null;
                Navigator.pop(_);
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Themes.mainColor, fontSize: 15),
              ),
            )
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
      backgroundColor: Themes.gradientColors.last,
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Due to intensity experienced your coffe reading will be queued. If you approve, please click below.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Themes.mainColor, fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                sendFortune = true;
                Navigator.pop(_);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * .5, 40),
                primary: Colors.purple,
              ),
              child: Text(
                "Yes",
                style: TextStyle(color: Themes.mainColor),
              ),
            ),
            TextButton(
              onPressed: () {
                sendFortune = false;
                Navigator.pop(_);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * .5, 40),
                primary: Colors.purple,
              ),
              child: Text(
                "No",
                style: TextStyle(color: Themes.mainColor),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  return sendFortune;
}
