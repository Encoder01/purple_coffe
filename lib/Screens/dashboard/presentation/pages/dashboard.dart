import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ionicons/ionicons.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/AddUserModel.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/add_user_usecase.dart';
import 'package:purple_coffe/core/params/add_user_params.dart';

import '../../../../injection_container.dart';

class DashBoard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AddUserUseCase addUserUseCase=serviceLocator();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 5,),
          Text("Mor Fincan"),
          Text("fotoğrafta belirtildiği gibi fotoları çekin"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {
                addUserUseCase.call(
                    AddUserParams(addUser: AddUserModel(adSoyad: "fasfasf", dateTime: "", userId: "asdasf")));
              }, icon: Icon(Ionicons.cube)),
              IconButton(onPressed: () {}, icon: Icon(Ionicons.cube)),
              IconButton(onPressed: () {}, icon: Icon(Ionicons.cube)),
              IconButton(onPressed: () {}, icon: Icon(Ionicons.cube))
            ],
          ),
          Text("Artık tabak resmi çekebilirsiniz"),
          IconButton(onPressed: () {}, icon: Icon(Ionicons.cube)),
          TextButton(onPressed: () {}, child: Text("Gönder"))
        ],
      ),
    );
  }
}
