import 'package:flutter/cupertino.dart';

class BodyHeader extends StatelessWidget {
  const BodyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*.02,),
        Image.asset(
          "assets/logo/logo.png",
          width: 100,
          height: 160,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/logo/title_en.png",
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
