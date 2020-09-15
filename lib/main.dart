import 'package:flutter/material.dart';
import 'package:lskdemo/pages/search_page.dart';
import 'bottom_navigation_widget.dart';

void main() {
  runApp(MyApp());
}

const _mainColor = Color(0xFF006FF5);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '低仿携程App',
      theme: ThemeData(
        primaryColor: _mainColor,
      ),
      routes: {
        'search':(context)=>SearchPage(),
      },
      home: BottomNavigationWidget(),
    );
  }
}
