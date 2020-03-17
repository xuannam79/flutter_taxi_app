import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/app.dart';
import 'package:flutter_myapp/src/bloc/auth_bloc.dart';
import 'package:flutter_myapp/src/resources/login_page.dart';

void main() => runApp(MyApp(new AuthBloc(), MaterialApp(
  home: LoginPage(),
)));
