import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/model.dart';

class DataService {
  Future<Weather> getWeather() async {
    final queryParameters = {
      'latitude': '45.57',
      'longitude': '-73.69',
      'hourly': 'temperature_2m,relativehumidity_2m,windspeed_10m',
      'current_weather': 'true'
    };

    final uri =
        Uri.https('api.open-meteo.com', '/v1/forecast', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json =  jsonDecode(response.body);
    return Weather.fromJson(json);
  }
}
