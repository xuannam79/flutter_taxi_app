import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/resources/profile_page.dart';
import 'package:flutter_myapp/src/resources/ride_history_page.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 40,),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ProfilePage()));
          },
          leading: Image.asset("ic_menu_user.png"),
          title: Text(
            "My Profile",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          onTap: () {
            print(111111);
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>RideHistoryPage()));
          },
          leading: Image.asset("ic_menu_history.png"),
          title: Text(
            "Ride History",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_menu_percent.png"),
          title: Text(
            "Offers",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_menu_notify.png"),
          title: Text(
            "Notifications",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_menu_help.png"),
          title: Text(
            "Help & Supports",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_menu_logout.png"),
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
      ],
    );
  }
}
