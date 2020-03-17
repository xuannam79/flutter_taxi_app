import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/resources/widget/home_menu.dart';
import 'package:flutter_myapp/src/resources/widget/ride_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(16.0759808, 108.2228736),
                zoom: 14.4746
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                children: <Widget>[
                  AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: Text(
                      "Taxi App",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: FlatButton(
                      onPressed: (){
                        _scaffoldKey.currentState.openDrawer();
                      },
                      child: Image.asset("ic_menu.png"),
                    ),
                    actions: <Widget>[Image.asset("ic_notify.png")],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: RidePicker(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: HomeMenu(),
      ),
    );
  }
}
