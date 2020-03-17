import 'dart:async';

import 'package:flutter_myapp/src/repository/place_service.dart';

class PlaceBloc {
  var _placeController = StreamController();
  Stream get placeStream => _placeController.stream;

  void searchPlace(String keyword) {
    _placeController.sink.add("start");
    print("start");
    PlaceService.searchPlace(keyword).then((rs) {
      print(rs);

      _placeController.sink.add(rs);
    }).catchError(() {

    });
  }

  void dispose() {
    _placeController.close();
  }
}