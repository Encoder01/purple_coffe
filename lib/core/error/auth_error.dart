import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:one_context/one_context.dart';

class AuthError{
    String handleError(error){
    String errorMessage="";
    print(error);
    switch (error.code) {
      case "invalid-email":
        errorMessage = AppLocalizations.of(OneContext().context!)!.sign_err_1;
        break;
      case "wrong-password":
        errorMessage = AppLocalizations.of(OneContext().context!)!.sign_err_3;
        break;
      case "user-not-found":
        errorMessage = AppLocalizations.of(OneContext().context!)!.sign_err_4;
        break;
      case "user-disabled":
        errorMessage =AppLocalizations.of(OneContext().context!)!.sign_err_5;
        break;
      case "operation-not-allowed":
        errorMessage = AppLocalizations.of(OneContext().context!)!.sign_err_6;
        break;
      case "email-already-in-use":
        errorMessage= AppLocalizations.of(OneContext().context!)!.sign_err_7;
        break;
      default:
        errorMessage =AppLocalizations.of(OneContext().context!)!.sign_err_9;
    }
    return errorMessage;
  }
}