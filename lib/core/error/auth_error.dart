class AuthError{
    String handleError(error){
    String errorMessage="";
    switch (error.code) {
      case "invalid-email":
        errorMessage = "Your email address appears to be malformed.";
        break;
      case "wrong-password":
        errorMessage = "Your password is wrong.";
        break;
      case "user-not-found":
        errorMessage = "User with this email doesn't exist.";
        break;
      case "user-disabled":
        errorMessage = "User with this email has been disabled.";
        break;
      case "operation-not-allowed":
        errorMessage = "Too many requests. Try again later.";
        break;
      case "email-already-in-use":
        errorMessage= "Email already used.";
        break;
      default:
        errorMessage = error.toString();
    }
    return errorMessage;
  }
}