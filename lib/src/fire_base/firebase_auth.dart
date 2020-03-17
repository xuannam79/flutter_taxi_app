import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp( String name, String phone, String email, String pass,
      Function onSuccess, Function(String) onRegisterErr) {
    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
          _createUser(user.user.uid, name, phone, onSuccess, onRegisterErr);
     }).catchError((err) {
      _onSignUpErr(err.code, onRegisterErr);
    });
  }

  _createUser(String userId, String name, String phone, Function onSuccess,
      Function(String) onRegisterErr) {
    var user = {"name" : name, "phone" : phone};
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(user).then((user){
      //success
      onSuccess();
    }).catchError((err){
      onRegisterErr("Signup fail, please try again");
    });
  }

  void _onSignUpErr(String code, Function(String) onRegisterErr) {
    switch(code) {
      case "ERROR_INVALID_CREDENTIAL":
      case "ERROR_INVALID_EMAIL":
        onRegisterErr("Email address is malformed");
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        onRegisterErr("Email is already in use by a different account");
        break;
      case "ERROR_WEAK_PASSWORD":
        onRegisterErr("Password is not strong enough");
        break;
      default:
        onRegisterErr("Signup fail, please try again");
        break;
    }
  }

  void signIn( String email, String pass, Function onSuccess,
      Function(String) onSignInErr) {
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass)
        .then((user){
      onSuccess();
    }).catchError((err){
      onSignInErr("Sign In fail, please try again");
    });
  }
}