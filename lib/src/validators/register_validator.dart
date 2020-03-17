class RegisterValidator {
  static bool isValidName(String name) {
    return name != null && name.length > 0;
  }

  static bool isValidPhone(String phone) {
    return phone != null && phone.length > 0;
  }

  static bool isValidEmail(String email) {
    return email != null && email.length > 0 && email.contains("@");
  }

  static bool isValidPass(String pass) {
    return pass != null && pass.length > 8;
  }
}