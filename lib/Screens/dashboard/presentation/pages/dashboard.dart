import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/manager/user_bloc.dart';
import 'package:purple_coffe/Screens/dashboard/presentation/pages/profile.dart';
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
  void initState() {
    BlocProvider.of<UserBloc>(context).add(GetUser(widget.appUserModel.uid!));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Themes.gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Offstage(
                offstage: _selectedIndex != 0,
                child: SendFortuneTells(widget.appUserModel)),
            Offstage(
              offstage: _selectedIndex != 1,
              child: MyFortuneTells(
                  user: widget.appUserModel,
                  onTap: (value) => _onItemTapped(value)),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: ProfilePage(widget.appUserModel),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Themes.gradientColors.last,
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
            icon: Icon(Ionicons.pricetag, color: Themes.mainColor),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Themes.mainColor),
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
