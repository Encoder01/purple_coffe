import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            AppLocalizations.of(context)!.title_path,
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
