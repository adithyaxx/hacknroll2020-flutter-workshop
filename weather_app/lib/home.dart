import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/blocs/bloc_provider.dart';
import 'package:weather_app/blocs/home_bloc.dart';
import 'package:weather_icons/weather_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => bloc.inEvent.add(true),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: StreamBuilder(
          stream: bloc.outForecast,
          builder: (context, snapshot) {
            String forecast = "Refreshing...";

            if (snapshot.hasData) forecast = snapshot.data;

            return Column(children: [
              Text(
                "Clementi",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                forecast,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 8),
              ),
              Expanded(
                child: (forecast == "refreshing")
                    ? SpinKitFadingCircle(
                        color: Colors.white,
                      )
                    : BoxedIcon(
                        _getIcon(forecast),
                        size: 100,
                        color: Colors.white,
                      ),
              ),
              SizedBox(
                height: 100,
              )
            ]);
          },
        ),
      ),
    );
  }
}

_getIcon(String val) {
  switch (val) {
    case 'Cloudy':
      return WeatherIcons.cloudy;
    case 'Fair (Day)':
      return WeatherIcons.day_sunny;
    case 'Fair (Night)':
      return WeatherIcons.night_clear;
    case 'Fair & Warm':
      return WeatherIcons.day_sunny_overcast;
    case 'Hazy':
      return WeatherIcons.smoke;
    case 'Heavy Rain':
      return WeatherIcons.rain_wind;
    case 'Heavy Showers':
      return WeatherIcons.showers;
    case 'Heavy Thundery Showers':
      return WeatherIcons.thunderstorm;
    case 'Heavy Thundery Showers with Gusty Winds':
      return WeatherIcons.thunderstorm;
    case 'Light Rain':
      return WeatherIcons.sprinkle;
    case 'Light Showers':
      return WeatherIcons.showers;
    case 'Mist':
      return WeatherIcons.fog;
    case 'Moderate Rain':
      return WeatherIcons.rain;
    case 'Partly Cloudy (Day)':
      return WeatherIcons.day_cloudy;
    case 'Partly Cloudy (Night)':
      return WeatherIcons.night_alt_cloudy;
    case 'Passing Showers':
      return WeatherIcons.showers;
    case 'Showers':
      return WeatherIcons.showers;
    case 'Slightly Hazy':
      return WeatherIcons.smoke;
    case 'Thundery Showers':
      return WeatherIcons.storm_showers;
    case 'Windy':
      return WeatherIcons.cloudy_windy;
  }

  return WeatherIcons.cloudy;
}
