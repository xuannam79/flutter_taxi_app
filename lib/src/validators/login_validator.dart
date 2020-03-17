class LoginValidator {
  static bool isValidEmail( String email ) {
    return email != null && email.length > 0 && email.contains("@");
  }

  static bool isValidPass(String pass) {
    return pass != null && pass.length > 8;
  }
}