import 'package:flutter/material.dart';
//import 'package:lskdemo/test-demo/dialog.dart';
import 'package:lskdemo/test-demo/event.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePage createState() {
    return _ServicePage();
  }
}

class _ServicePage extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('客服'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
//        body:MyDialog(),
        body:MyEvent(),
    );
  }
}


