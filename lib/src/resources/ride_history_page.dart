import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/resources/widget/ride_history_child.dart';

class RideHistoryPage extends StatefulWidget {
  @override
  _RideHistoryPageState createState() => _RideHistoryPageState();
}

class _RideHistoryPageState extends State<RideHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Ride History",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        actions: <Widget>[Image.asset("ic_notify.png")],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Showing Recent Rides",
                  style: TextStyle(
                    color: Color(0xFF1976D2),
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RideHistoryChild()
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RideHistoryChild()
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RideHistoryChild()
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RideHistoryChild()
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RideHistoryChild()
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RideHistoryChild()
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RideHistoryChild()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
