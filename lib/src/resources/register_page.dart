import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/bloc/auth_bloc.dart';
import 'package:flutter_myapp/src/resources/dialog/loading_dialog.dart';
import 'package:flutter_myapp/src/resources/dialog/msg_dialog.dart';
import 'package:flutter_myapp/src/resources/home_page.dart';
import 'package:flutter_myapp/src/resources/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthBloc authBloc = new AuthBloc();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset('ic_car_red.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  "Welcome Aboard!",
                  style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                ),
              ),
              Text(
                "Signup with iCab in simple steps",
                style: TextStyle(fontSize: 16, color: Color(0xff606470)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
                child: StreamBuilder(
                  stream: authBloc.nameStream,
                  builder: (context, snapshot) => TextField(
                    controller: _nameController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      errorText: snapshot.hasError ? snapshot.error : null,
                      labelText: "Name",
                      prefixIcon: Container(
                        width: 50, child: Image.asset("ic_user.png")),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xffCED0D2), width: 1),
                        borderRadius:
                        BorderRadius.all(Radius.circular(6))
                      )
                    ),
                  )
                ),
              ),
              StreamBuilder(
                stream: authBloc.phoneStream,
                builder: (context, snapshot) => TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    errorText: snapshot.hasError ? snapshot.error : null,
                    prefixIcon: Container(
                      width: 50, child: Image.asset("ic_phone.png")),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xffCED0D2), width: 1),
                      borderRadius:
                      BorderRadius.all(Radius.circular(6))
                    )
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: StreamBuilder(
                    stream: authBloc.emailStream,
                    builder: (context, snapshot) => TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "Email",
                          errorText: snapshot.hasError ? snapshot.error : null,
                          prefixIcon: Container(
                              width: 50, child: Image.asset("ic_mail.png")),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffCED0D2), width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(6)))),
                    )),
              ),
              StreamBuilder(
                  stream: authBloc.passStream,
                  builder: (context, snapshot) => TextField(
                    controller: _passController,
                    obscureText: true,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error : null,
                        labelText: "Password",
                        prefixIcon: Container(
                            width: 50, child: Image.asset("ic_lock.png")),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)))),
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: onSignupClicked,
                    child: Text(
                      "Signup",
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
                    text: "Already a User? ",
                    style: TextStyle(color: Color(0xff606470), fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                          text: "Login now",
                          style: TextStyle(
                              color: Color(0xff3277D8), fontSize: 16)
                      )
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
  
  void onSignupClicked() {
    var isValid = authBloc.isValidRegister(_nameController.text,
        _phoneController.text, _emailController.text, _passController.text);
    if(isValid) {
      // create user
      // loading dialog
      LoadingDialog.showLoadingDialog(context, 'Loading...');
      
      authBloc.signUp(_nameController.text, _phoneController.text,
          _emailController.text, _passController.text, () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage())
        );
      },(msg){
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, "Sign-In", msg);
          // show msg dialog
      });
    }
  }
}
