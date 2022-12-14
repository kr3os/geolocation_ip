
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:geolocation_ip/models/geolocation_data_model.dart';

class GeolocatorAPI {
  static Future<GeolocationData?>getData({ String query = ''}) async {
    try {
      final response = await http.get( Uri.http('ip-api.com' , '/json/$query') );
      if ( response.statusCode == 200 ){
        final parsed = jsonDecode(response.body);
        return GeolocationData.fromJson(parsed);
      }
      return null;
    } catch(e){
      return null;
    }
  }
}