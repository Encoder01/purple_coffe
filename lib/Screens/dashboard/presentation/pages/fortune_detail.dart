import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/widgets/elevated_button.dart';
import 'package:purple_coffe/config/themes/themes.dart';

import '../../domain/entities/FortuneModel.dart';
import '../manager/fortune_bloc.dart';

class FortuneDetail extends StatelessWidget {
  FortuneDetail(
    this.fortuneTells,
  );

  FortuneTells fortuneTells;
  String? soruText;
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
          IconButton(onPressed: () {}, icon: Icon(Ionicons.text)),
          IconButton(onPressed: () {}, icon: Icon(Ionicons.trash))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration:   BoxDecoration(
            gradient: LinearGradient(
                colors:Themes.gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.repeated),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AutoSizeText(
                fortuneTells.fortuneComment!,
                minFontSize: 15,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, color: Themes.mainColor),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                textInputAction: TextInputAction.done,
                maxLength: 300,
                minLines: 6,
                maxLines: 8,
                onChanged: (val){
                  soruText=val;
                },
                decoration: InputDecoration(
                    hintText: fortuneTells.fortune_quest!["quest"].toString(),
                    hintStyle: TextStyle(color: Themes.mainColor),
                    errorMaxLines: 10,
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:   BorderSide(color: Themes.mainColor, width: 2.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:  BorderSide(color: Themes.mainColor, width: 2.5),
                  ),
                ),
                cursorColor: Themes.mainColor,
                style: TextStyle(color:Themes.mainColor),
                keyboardType: TextInputType.multiline,
                validator: (String? value) {
                  return value!.isEmpty ? 'Username is mandatory' : null;
                },
              ),
              ElevatedButtonWidget(text: "Soru Gönder",onPress: (){
                BlocProvider.of<FortuneBloc>(context).add(
                  SetFortunes(
                    FortuneModel(
                      fortuneId: fortuneTells.fortuneId!,
                      userId: fortuneTells.userId!,
                      flatCup: fortuneTells.flatCup!,
                      inCup: fortuneTells.inCup!,
                      fortune_quest:   {
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
