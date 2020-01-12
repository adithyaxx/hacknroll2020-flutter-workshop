import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Future<String> fetchWeatherForecast() async {
    String weatherApiUrl =
        "https://api.data.gov.sg/v1/environment/2-hour-weather-forecast";
    String forecast;
    Dio dio = Dio();

    RequestOptions requestOptions = RequestOptions(
        receiveTimeout: 5000,
        connectTimeout: 5000,
        method: 'GET',
        responseType: ResponseType.json,
        validateStatus: (status) {
          return status == 200;
        });

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.interceptors.add(InterceptorsWrapper(onResponse: (Response response) {
      if (response.statusCode == 200) {
        for (Map map in response.data["items"][0]["forecasts"]) {
          if (map["area"] == "Clementi") 
            forecast = map["forecast"];
        }
      }
      return response;
    }));

    try {
      await dio.get(weatherApiUrl, options: requestOptions);
    } catch (e) {
      print(e);
      return "Error";
    }

    return forecast;
  }
}
