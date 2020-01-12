import 'package:flutter/material.dart';
import 'package:weather_app/blocs/bloc_provider.dart';
import 'package:weather_app/blocs/home_bloc.dart';
import 'package:weather_app/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        child: HomePage(),
        bloc: HomeBloc(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
