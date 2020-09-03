import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() {
    return _HomePage();
  }
}

//  The argument type . HomePage' can't be assigned to the parameter type 'Ticke
class _HomePage extends State with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List tabs = [
    '首页',
    '特价爆款',
    '周边',
    '避暑',
    '亲子时光',
    '海岛',
    '网红',
    '温泉',
    '建筑',
    '古镇',
    '国家公园'
  ];
  TabController _tabController;
  static const _mainColor = Color(0xFF006FF5);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _mainColor, // todo:需要自定义组件，做渐变色的背景
//        toolbarHeight: 76,
//        title: Text('携程首页'),
//        centerTitle: true,
        title: Container(
          height: 30,
          decoration: BoxDecoration(
            color: Color(0x4CFFFFFF),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        bottom: TabBar(
          tabs: tabs
              .map((text) => Tab(
                    text: text,
                  ))
              .toList(),
//          controller: TabController(length: tabs.length,vsync: this), // 会报错
          controller: _tabController,
          isScrollable: true,
        ),
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
        type: BottomNavigationBarType.fixed,
        // 防止不显示颜色
        selectedFontSize: 16,
        unselectedFontSize: 16,
        fixedColor: _mainColor,
        onTap: (int index) {
          //  从0开始
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
