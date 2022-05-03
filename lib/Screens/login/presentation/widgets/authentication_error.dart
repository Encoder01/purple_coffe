import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../core/constants/app_constants.dart';
import '../manager/login_bloc.dart';

Center buildAuthenticationErrorWidget(ErrorLoggedState state) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:const [
          Icon(Ionicons.refresh),
          SizedBox(height: 10),
          Text(kUnexpectedError),
      ],
    ),
  );
}
