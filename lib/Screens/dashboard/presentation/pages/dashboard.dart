import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/UserModel.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/pages/my_fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/pages/send_fortune_tells.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';

import '../../../../config/themes/themes.dart';

class DashBoard extends StatefulWidget {
  DashBoard(this.appUserModel);

  AppUserModel appUserModel;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/arkaplan.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Offstage(
                offstage: _selectedIndex != 0,
                child: SendFortuneTells(widget.appUserModel.uid!)),
            Offstage(
              offstage: _selectedIndex != 1,
              child: MyFortuneTells(fortuneIds: widget.appUserModel.fTellId!),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF371c46),
        elevation: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Themes.mainColor),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.chatbox_ellipses, color: Themes.mainColor),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Themes.mainColor),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Themes.mainColor),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 33,
        onTap: _onItemTapped,
      ),
    );
  }
}
