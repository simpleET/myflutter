import 'package:flutter/material.dart';

import 'package:lskdemo/pages/home_page-lj.dart';
import 'package:lskdemo/pages/my_page.dart';
import 'package:lskdemo/pages/service_page.dart';
import 'package:lskdemo/pages/travel_page.dart';
import 'package:lskdemo/pages/trip_page.dart';

const String home_page = 'home_page';
const String trip_page = 'trip_page';
const String travel_page = 'travel_page';
const String service_page = 'service_page';
const String my_page = 'my_page';

class Routes {
 static Map<String,String> home ={
    '0':'home_page',
    '1':'trip_page',
    '2':'travel_page',
    '3':'service_page',
    '4':'my_page',
  };
  static const String home_page = 'home_page';
  static const String trip_page = 'trip_page';
  static const String travel_page = 'travel_page';
  static const String service_page = 'service_page';
  static const String my_page = 'my_page';

  static Map<String, WidgetBuilder> routes ={
      'home_page': (context) => HomePage(),
      'trip_page': (context) => TripPage(),
      'travel_page': (context) => TravelPage(),
      'service_page': (context) => ServicePage(),
      'my_page': (context) => MyPage(),
  };
}
