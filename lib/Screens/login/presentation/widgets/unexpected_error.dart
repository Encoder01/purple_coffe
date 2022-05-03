import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../core/constants/app_constants.dart';

Center buildUnexpectedErrorWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Ionicons.bug_outline),
        SizedBox(height: 10),
        Text(kUnexpectedError),
      ],
    ),
  );
}
