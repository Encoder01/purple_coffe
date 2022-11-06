import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:purple_coffe/config/themes/themes.dart';
import 'package:purple_coffe/core/constants/app_constants.dart';

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
                children: [
                  const Icon(Ionicons.camera),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(AppLocalizations.of(context)!.camera),
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
                children: [
                  const Icon(Ionicons.albums),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(AppLocalizations.of(context)!.gallery),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                source = null;
                Navigator.pop(_);
              },
              child: Text(
                AppLocalizations.of(context)!.cancel,
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

Future<bool> busyDialog(BuildContext context, String title, bool isOk) async {
  bool sendFortune = false;
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Themes.gradientColors.last,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Themes.mainColor, fontSize: 18),
        ),
      ),
      actions: isOk
          ? [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(_);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * .5, 40),
                    primary: Colors.purple,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.ok,
                    style: TextStyle(color: Themes.mainColor),
                  ),
                ),
              ),
            ]
          : [
              Center(
                child: TextButton(
                  onPressed: () {
                    sendFortune = true;
                    Navigator.pop(_);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * .5, 40),
                    primary: Colors.purple,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.yes,
                    style: TextStyle(color: Themes.mainColor),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    sendFortune = false;
                    Navigator.pop(_);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * .5, 40),
                    primary: Colors.purple,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.no,
                    style: TextStyle(color: Themes.mainColor),
                  ),
                ),
              ),
            ],
    ),
  );
  return sendFortune;
}
