import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/fire_base/firebase_auth.dart';
import 'dart:async';

import 'package:flutter_myapp/src/validators/register_validator.dart';

class AuthBloc {
  var _fireAuth = FireAuth();
  StreamController _nameController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;

  bool isValidRegister( String name, String phone, String email, String pass) {
    if(!RegisterValidator.isValidName(name)) {
      _nameController.sink.addError("Vui lòng nhập tên");
      return false;
    }
    _nameController.sink.add("");

    if(!RegisterValidator.isValidPhone(phone)) {
      _phoneController.sink.addError("Vui lòng nhập SDT");
      return false;
    }
    _phoneController.sink.add("");

    if(!RegisterValidator.isValidEmail(email)) {
      _emailController.sink.addError("Vui lòng nhập email hợp lệ");
      return false;
    }
    _emailController.sink.add("");

    if(!RegisterValidator.isValidPass(pass)) {
      _passController.sink.addError("Vui lòng nhập mật khẩu");
      return false;
    }
    _passController.sink.add("");

    return true;
  }

  void signUp(String name, String phone, String email, String pass,
      Function onSuccess, Function(String) onRegisterErr) {
    _fireAuth.signUp(name, phone, email, pass, onSuccess, onRegisterErr);
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInErr) {
    _fireAuth.signIn(email, pass, onSuccess, onSignInErr);
  }

  void dispose() {
    _nameController.close();
    _phoneController.close();
    _emailController.close();
    _passController.close();
  }
}