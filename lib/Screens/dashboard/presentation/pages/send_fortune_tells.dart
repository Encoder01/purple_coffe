import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/add_fortune_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/add_user_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/widgets/colored_container.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/widgets/colored_text.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'dart:async';
import '../../../../injection_container.dart';
import '../../../login/presentation/manager/login_bloc.dart';

class SendFortuneTells extends StatefulWidget {
  @override
  State<SendFortuneTells> createState() => _SendFortuneTellsState();
}

class _SendFortuneTellsState extends State<SendFortuneTells> {
  AddUserUseCase addUserUseCase = serviceLocator();
  AddFortuneUseCase addFortuneUseCase = serviceLocator();
  List<MemoryImage> inCup = [];
  List<MemoryImage> inFlat = [];
  final ImagePicker _picker = ImagePicker();

  Future<MemoryImage?> imagePicker(
      {BuildContext? context, bool isMultiImage = false}) async {
    ImageSource? source = await dialogCameraOrGallery();
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source!,
      );
      Uint8List asByte = await pickedFile!.readAsBytes();
      final memoryImage = MemoryImage(asByte);
      return memoryImage;
    } catch (e) {
    }
    return null;
  }

  Future<ImageSource?> dialogCameraOrGallery() async {
    ImageSource? source;
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.hardEdge,
        content: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/arkaplan.png"),
              fit: BoxFit.fill,
            ),
          ),
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

  @override
  void initState() {
    addUserUseCase = serviceLocator();
    addFortuneUseCase = serviceLocator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset("assets/logo/title_tr.png"),
          const ColoredText(
            data:
                "Take a picture of the inside of your cup from four angles, "
                "as indicated in the photos, "
                "by turning your cup counterclockwise.",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ColoredContainer(
                  child: IconButton(
                    onPressed: () async {
                      if (inCup.isNotEmpty && inCup.length >= 1) {
                        inCup[0] = (await imagePicker(
                          context: context,
                          isMultiImage: false,
                        ))!;
                      } else {
                        inCup.add((await imagePicker(
                          context: context,
                          isMultiImage: false,
                        ))!);
                      }
                      setState(() {});
                    },
                    iconSize: 60,
                    icon: inCup.isNotEmpty && inCup.length >= 1
                        ? Image(
                            image: inCup[0],
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            "assets/images/1.png",
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                ),
                ColoredContainer(
                  child: IconButton(
                    onPressed: () async {
                      if (inCup.isNotEmpty && inCup.length >= 2) {
                        inCup[1] = (await imagePicker(
                          context: context,
                          isMultiImage: false,
                        ))!;
                      } else {
                        inCup.add(
                          (await imagePicker(
                            context: context,
                            isMultiImage: false,
                          ))!,
                        );
                      }
                      setState(() {});
                    },
                    iconSize: 60,
                    icon: inCup.isNotEmpty && inCup.length >= 2
                        ? Image(
                            image: inCup[1],
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            "assets/images/2.png",
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                ),
                ColoredContainer(
                  child: IconButton(
                    onPressed: () async {
                      if (inCup.isNotEmpty && inCup.length >= 3) {
                        inCup[2] = (await imagePicker(
                          context: context,
                          isMultiImage: false,
                        ))!;
                      } else {
                        inCup.add((await imagePicker(
                          context: context,
                          isMultiImage: false,
                        ))!);
                      }
                      setState(() {});
                    },
                    iconSize: 60,
                    icon: inCup.isNotEmpty && inCup.length >= 3
                        ? Image(
                            image: inCup[2],
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            "assets/images/3.png",
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                ),
                ColoredContainer(
                  child: IconButton(
                    onPressed: () async {
                      if (inCup.isNotEmpty && inCup.length >= 4) {
                        inCup[3] = (await imagePicker(
                          context: context,
                          isMultiImage: false,
                        ))!;
                      } else {
                        inCup.add((await imagePicker(
                          context: context,
                          isMultiImage: false,
                        ))!);
                      }
                      setState(() {});
                    },
                    iconSize: 60,
                    icon: inCup.isNotEmpty && inCup.length >= 4
                        ? Image(
                            image: inCup[3],
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            "assets/images/4.png",
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                ),
              ],
            ),
          ),
          const ColoredText(
            data: "You can now take a photo of your plate.",
          ),
          ColoredContainer(
            child: IconButton(
              onPressed: () async {
                if (inFlat.isNotEmpty && inFlat.length >= 1) {
                  inFlat[0] = (await imagePicker(
                    context: context,
                    isMultiImage: false,
                  ))!;
                } else {
                  inFlat.add((await imagePicker(
                    context: context,
                    isMultiImage: false,
                  ))!);
                }

                setState(() {});
              },
              iconSize: 60,
              icon: inFlat.isNotEmpty && inFlat.length >= 1
                  ? Image(
                      image: inFlat[0],
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      "assets/images/5.png",
                      fit: BoxFit.fitWidth,
                    ),
            ),
          ),
          TextButton(
            onPressed: () {
              /*addFortuneUseCase.call(
                AddFortuneParams(
                  addFortune: AddFortuneModel(
                    userId: widget.appUserModel.uid,
                    flatCup: [base64Encode(inFlat.first.bytes)],
                    inCup: [base64Encode(inCup.first.bytes)],
                  ),
                ),
              );*/
             /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyFortuneTells(fortuneIds: ["RB0zYK7XvevsTCLmwJmd"]),
                  ));*/
              BlocProvider.of<LoginBloc>(context).add(LoggedOut());
            },
            child: const ColoredText(
              data: "Coffee Reading Send",
            ),
          )
        ],
      ),
    );
  }
}
