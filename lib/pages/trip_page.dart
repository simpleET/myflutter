import 'package:flutter/material.dart';


class TripPage extends StatefulWidget {
  @override
  _TripPage createState() {
    return _TripPage();
  }
}

class _TripPage extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('行程'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('行程'),
      ),
    );
  }
}
