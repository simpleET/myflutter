import 'package:flutter/material.dart';

import 'package:lskdemo/pages/home_page.dart';
import 'package:lskdemo/pages/my_page.dart';
import 'package:lskdemo/pages/service_page.dart';
import 'package:lskdemo/pages/travel_page.dart';
import 'package:lskdemo/pages/trip_page.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  BottomNavigationWidgetState createState() {
    return BottomNavigationWidgetState();
  }
}

class BottomNavigationWidgetState extends State {
  int _currentIndex = 0;
  static const _mainColor = Color(0xFF006FF5);

  List<Widget> pageList = List();

  @override
  void initState() {
    super.initState();
    pageList
      ..add(HomePage())
      ..add(TripPage())
      ..add(TravelPage())
      ..add(ServicePage())
      ..add(MyPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*   appBar: AppBar(
        toolbarHeight: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color(0xFF006FF5),
                Color(0xFF38A6FF),
              ])),
        ),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range), title: Text('行程')),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), title: Text('旅拍')),
          BottomNavigationBarItem(
              icon: Icon(Icons.headset_mic), title: Text('客服')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('我的')),
        ],
        currentIndex: _currentIndex,
        iconSize: 22,
        type: BottomNavigationBarType.fixed,
        // 防止不显示颜色
        selectedFontSize: 12,
        unselectedFontSize: 12,
        fixedColor: _mainColor,
        // 从0开始
        onTap: (int index) async {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: MediaQuery.removePadding(
          context: context, removeTop: true, child: pageList[_currentIndex]),
    );
  }
}
