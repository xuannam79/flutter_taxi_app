import 'package:flutter/material.dart';

class RideHistoryChild extends StatefulWidget {
  @override
  _RideHistoryChildState createState() => _RideHistoryChildState();
}

class _RideHistoryChildState extends State<RideHistoryChild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0x88999999),
              offset: Offset(1, 1),
              blurRadius: 10.0
            )
          ]
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 15,
            top: 27,
            height: 50,
            child: Center(
              child: Row(
                children: <Widget>[
                  Icon(Icons.star,color: Color(0xFFFBC02D), size: 18),
                  Icon(Icons.star,color: Color(0xFFFBC02D), size: 18),
                  Icon(Icons.star,color: Color(0xFFFBC02D), size: 18),
                  Icon(Icons.star,color: Color(0xFFFBC02D), size: 18),
                  Icon(Icons.star_border,color: Color(0xFFFBC02D), size: 18),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
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
                            child: Image.asset("ic_location_black.png"),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          height: 50,
                          child: Center(
                            child: Text("01 May 2020", style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 50),
                          child: Text(
                            "81 Quang Trung",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
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
                          height: 50,
                          child: Center(
                            child: Text(
                              "\$2.94",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFBDBDBD)
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 50),
                          child: Text(
                            "Home",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
