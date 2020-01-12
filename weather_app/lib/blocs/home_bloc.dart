import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:weather_app/api_provider.dart';
import 'package:weather_app/blocs/bloc_provider.dart';

class HomeBloc implements BlocBase {
  ApiProvider _apiProvider = ApiProvider();

  // Stream to handle the counter
  StreamController _forecastController = BehaviorSubject<String>();
  Stream<String> get outForecast => _forecastController.stream;

  // Stream to handle the counter
  StreamController _forecastEventController = BehaviorSubject<bool>();
  Sink get inEvent => _forecastEventController.sink;

  // Constructor
  HomeBloc() {
    _handleLogic();

    _forecastEventController.stream.listen((trigger) => _handleLogic(true));
  }

  @override
  void dispose() {
    _forecastController.close();
    _forecastEventController.close();
  }

  _handleLogic([refreshing = false]) async {
    if (refreshing)
      _forecastController.sink.add("Refreshing...");
    
    _forecastController.sink.add(await _apiProvider.fetchWeatherForecast());
  }
}
