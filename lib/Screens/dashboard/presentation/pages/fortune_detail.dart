import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/widgets/elevated_button.dart';
import 'package:purple_coffe/config/env/env.dart';
import 'package:purple_coffe/config/themes/themes.dart';

import '../../domain/entities/FortuneModel.dart';
import '../manager/fortune_bloc.dart';

class FortuneDetail extends StatelessWidget {
  FortuneDetail(this.fortuneTells,);

  FortuneTells fortuneTells;
  String? soruText;
  ValueNotifier<double> fontsizeValue = ValueNotifier(16);

  void changeFontSize(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 0.25, //set this as you want
              maxChildSize: 0.3, //set this as you want
              minChildSize: 0.15, //set this as you want
              builder: (context, scrollController) {
                return Container(
                    color: Themes.gradientColors.first,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        IconButton(onPressed: () {
                          Navigator.of(context).pop();
                        },
                          icon: Icon(
                              Icons.minimize, color: Colors.white, size: 32),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Font Size", style: TextStyle(
                                color: Colors.white, fontSize: 21),),
                            Row(
                              children: [
                                IconButton(onPressed: () {
                                  fontsizeValue.value += 3.0;
                                }, icon: Icon(Icons.add, color: Colors.white,)),
                                Icon(Ionicons.text, color: Themes.mainColor,),
                                IconButton(onPressed: () {
                                  fontsizeValue.value -= 1.0;
                                }, icon: Icon(
                                  Icons.remove, color: Colors.white,))
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                ); //whatever you're returning, does not have to be a Container
              }
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF612883),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Kahve Falın",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Themes.mainColor),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {
            changeFontSize(context);
          }, icon: Icon(Ionicons.text)),
          IconButton(onPressed: () {}, icon: Icon(Ionicons.trash))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: Themes.gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.repeated),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ValueListenableBuilder(valueListenable: fontsizeValue,
                  builder: (context, double value, child) {
                    return AutoSizeText(
                      fortuneTells.fortuneComment!,
                      minFontSize: 15,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: value, color: Themes.mainColor),
                    );
                  }
              ),
              const SizedBox(height: 15,),
              TextFormField(
                textInputAction: TextInputAction.done,
                maxLength: AppEnvironment.appEnv.helpChar,
                minLines: 6,
                maxLines: 8,
                onChanged: (val) {
                  soruText = val;
                },
                decoration: InputDecoration(
                    hintText: fortuneTells.fortune_quest!["quest"].toString(),
                    hintStyle: TextStyle(color: Themes.mainColor),
                    errorMaxLines: 10,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Themes.mainColor, width: 2.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Themes.mainColor, width: 2.5),
                    ),
                    counterStyle: TextStyle(
                        color: Themes.mainColor, fontSize: 15)
                ),
                cursorColor: Themes.mainColor,
                style: TextStyle(color: Themes.mainColor),
                keyboardType: TextInputType.multiline,
                validator: (String? value) {
                  return value!.isEmpty ? 'Username is mandatory' : null;
                },
              ),
              ElevatedButtonWidget(text: "Soru Gönder", onPress: () {
                BlocProvider.of<FortuneBloc>(context).add(
                  SetFortunes(
                    FortuneModel(
                      fortuneId: fortuneTells.fortuneId!,
                      userId: fortuneTells.userId!,
                      flatCup: fortuneTells.flatCup!,
                      inCup: fortuneTells.inCup!,
                      fortune_quest: {
                        "answer": "null",
                        "quest": soruText!
                      },
                      createDate: fortuneTells.createDate!,
                      fortuneComment: fortuneTells.fortuneComment!,
                      isDone: fortuneTells.isDone!,
                    ),
                  ),
                );
              },),
            ],
          ),
        ),
      ),
    );
  }
}
