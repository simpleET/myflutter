import 'package:flutter/material.dart';


class TravelPage extends StatefulWidget {
  @override
  _TravelPage createState() {
    return _TravelPage();
  }
}

class _TravelPage extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('旅拍'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('旅拍'),
      ),
    );
  }
}
