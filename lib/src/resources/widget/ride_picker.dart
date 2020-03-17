import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/resources/ride_picker_page.dart';

class RidePicker extends StatefulWidget {
  @override
  _RidePickerState createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color(0x88999999),
            offset: Offset(0, 5),
            blurRadius: 5.0
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RidePickerPage())
                );
              },
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: <Widget>[
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image.asset("ic_location_black.png"),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image.asset("ic_remove_x.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text(
                        "81 Quang Trung",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16, color: Color(0xff323643)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: (){},
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: <Widget>[
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image.asset("ic_map_nav.png"),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Image.asset("ic_remove_x.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text(
                        "My location",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16, color: Color(0xff323643)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
