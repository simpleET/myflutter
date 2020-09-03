import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() {
    return _HomePage();
  }
}

class _HomePage extends State {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('携程首页'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range), title: Text('行程')),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), title: Text('旅拍')),
          BottomNavigationBarItem(icon: Icon(Icons.headset), title: Text('客服')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('我的')),
        ],
        currentIndex: _currentIndex,
        iconSize: 28,
        type: BottomNavigationBarType.fixed, // 防止不显示颜色
        selectedFontSize: 16,
        unselectedFontSize: 16,
        fixedColor: Color(0xFF45A6F9),
        onTap: (int index){ //  从0开始
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Center(
        child: Text('首页333'),
      ),
    );
  }
}
