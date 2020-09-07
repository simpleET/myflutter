import 'package:flutter/material.dart';
import 'package:lskdemo/pages/home_page.dart';
import 'package:dio/dio.dart';
import 'package:lskdemo/pages/my_page.dart';
import 'package:lskdemo/pages/service_page.dart';
import 'package:lskdemo/pages/travel_page.dart';
import 'package:lskdemo/pages/trip_page.dart';

void main() {
  runApp(MyApp());
}

const _mainColor = Color(0xFF006FF5);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '携程',
      theme: ThemeData(
        primaryColor: _mainColor,
      ),
      routes: {
        '/': (context) => HomePage(),
        'home_page': (context) => HomePage(),
        'trip_page': (context) => TripPage(),
        'travel_page': (context) => TravelPage(),
        'service_page': (context) => ServicePage(),
        'my_page': (context) => MyPage(),
      },
      initialRoute: 'home_page',
     /* onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context){
          String routeName = settings.name;
          print(routeName);
        });
      },*/
    );
  }
}
