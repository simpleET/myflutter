import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget{
  @override
  _SearchPage createState() {
    return _SearchPage();
  }

}


class _SearchPage extends State<SearchPage>{
	DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
  	return Scaffold(
		appBar: AppBar(
			title: Text('搜索页面'),
			centerTitle: true,
		),
		body: WillPopScope(
			child: Center(child: Text('搜索模块'),),
		),
	);
  }
}