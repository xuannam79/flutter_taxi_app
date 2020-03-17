import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/app.dart';
import 'package:flutter_myapp/src/resources/dialog/loading_dialog.dart';
import 'package:flutter_myapp/src/resources/dialog/msg_dialog.dart';
import 'package:flutter_myapp/src/resources/home_page.dart';
import 'package:flutter_myapp/src/resources/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 140,
              ),
              Image.asset('ic_car_green.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  "Welcome back!",
                  style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                ),
              ),
              Text(
                "Login to continue using iCab",
                style: TextStyle(fontSize: 16, color: Color(0xff606470)),
              ),
              StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                    child: TextField(
                      controller: _emailController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error : null,
                        labelText: "Email",
                        prefixIcon: Container(
                            width: 50, child: Image.asset("ic_mail.png")),
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6)))),
                    ),
                  );
                }
              ),
              StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return TextField(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    obscureText: true,
                    controller: _passController,
                    decoration: InputDecoration(
                      errorText: snapshot.hasError ? snapshot.error : null,
                      labelText: "Password",
                      prefixIcon: Container(
                          width: 50, child: Image.asset("ic_phone.png")),
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                  );
                }
              ),
              Container(
                constraints: BoxConstraints.loose(Size(double.infinity, 30)),
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: onSignInClicked,
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Color(0xff3277D8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  text: TextSpan(
                    text: "New user? ",
                    style: TextStyle(color: Color(0xff606470), fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                          text: "Sign up for a new account",
                          style: TextStyle(
                              color: Color(0xff3277D8), fontSize: 16))
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSignInClicked() {
    var authBloc = MyApp.of(context).authBloc;
    LoadingDialog.showLoadingDialog(context, "Loading...");
    authBloc.signIn(_emailController.text, _passController.text, (){
      LoadingDialog.hideLoadingDialog(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    }, (msg){
      LoadingDialog.hideLoadingDialog(context);
      MsgDialog.showMsgDialog(context, "Sign In", msg);
    });
  }
}
