import 'package:flutter/material.dart';


class MyPage extends StatefulWidget {
  @override
  _MyPage createState() {
    return _MyPage();
  }
}

class _MyPage extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('个人中心'),
      ),
    );
  }
}
