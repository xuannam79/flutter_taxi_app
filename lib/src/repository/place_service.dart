import 'package:flutter_myapp/src/model/place_item_res.dart';

class PlaceService {
  static Future<List<PlaceItemRes>> searchPlace(String keyword) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json?key=AIzaSyAhQfbsGt64iRAfB8Zb0Wzl8mSw66osLSA&language=vi&region=VN&query="+
            Uri.encodeQueryComponent(keyword);
    print(url);

  }
}