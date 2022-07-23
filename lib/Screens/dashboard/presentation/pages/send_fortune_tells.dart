import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/FortuneModel.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/fortune_bloc.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/widgets/colored_container.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/widgets/colored_text.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'package:purple_coffe/config/env/env.dart';
import 'package:purple_coffe/config/routes/router.gr.dart';
import 'package:purple_coffe/core/constants/firebase_constants.dart';
import 'package:purple_coffe/core/constants/functions.dart';

class SendFortuneTells extends StatefulWidget {
  final AppUserModel user;

  const SendFortuneTells(this.user);

  @override
  State<SendFortuneTells> createState() => _SendFortuneTellsState();
}

class _SendFortuneTellsState extends State<SendFortuneTells> {
  List<MemoryImage> inCup = [];
  List<MemoryImage> inFlat = [];
  final ImagePicker _picker = ImagePicker();

  Future<MemoryImage?> imagePicker(
      {BuildContext? context, bool isMultiImage = false}) async {
    ImageSource? source =
        await dialogCameraOrGallery(context!);
    if(source==null){
      return null;
    }
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 80,maxHeight: 1280,maxWidth: 720
      );
      Uint8List asByte = await pickedFile!.readAsBytes();
      final memoryImage = MemoryImage(asByte);
      return memoryImage;
    } catch (e) {
      showSnackBar(e.toString());
    }
    return null;
  }

  @override
  void initState() {
    BlocProvider.of<FortuneBloc>(context).add(GetMyFortunes(widget.user.uid!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<FortuneBloc, FortuneState>(
        builder: (context, state) {
          if (state is FortuneLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                    onPressed: () async {
                      AppEnvironment.appEnv = (await getEnvironment())!;
                      if (inCup.isNotEmpty && inFlat.isNotEmpty){
                        if (AppEnvironment.appEnv.readedDailyFortune! >=
                            AppEnvironment.appEnv.dailyFortune!) {
                          final bool isSendFortune = await busyDialog(context);
                          if (isSendFortune) {
                              sendFortune();
                          }
                        } else {
                          sendFortune();
                        }
                      }else{
                        showSnackBar("Lütfen önce gerekli yerlerin fotoğrafını çekiniz.");
                      }
                    },
                    child: const ColoredText(
                      data: "Coffee Reading Send",
                    ),
                  )
                ],
              ),
            );
          }
          else if(state is FortuneLoading){
            return Center(
              child: PlatformCircularProgressIndicator(),
            );
          }
          else {
            return Container();
          }
        },
      ),
    );
  }

  void sendFortune() {
    List<String> flatCup = [];
    List<String> cupIn = [];
    for (final element in inFlat) {
      flatCup.add(base64Encode(element.bytes));
    }
    for (final element in inCup) {
      cupIn.add(base64Encode(element.bytes));
      print(cupIn);
    }
    BlocProvider.of<FortuneBloc>(context).add(
      AddFortunes(FortuneModel(
        fortuneId: "",
        userId: widget.user.uid!,
        flatCup: flatCup,
        inCup: cupIn,
        fortuneNotif: "",
        fortune_quest: const {"answer": "null", "quest": "null"},
        createDate: DateTime.now(),
        fortuneComment: "Fal Yorumu",
        isDone: false,
      )),
    );
    inFlat=[];
    inCup=[];
    context.router.push(const SendedFortune());
  }
}
