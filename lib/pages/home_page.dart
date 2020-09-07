import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lskdemo/pages/trip_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() {
    return _HomePage();
  }
}

//  The argument type . HomePage' can't be assigned to the parameter type 'Ticke
class _HomePage extends State with SingleTickerProviderStateMixin {
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

  List topLinks = [
    {
      'name': '攻略.景点',
      'imgSrc': 'images/top-link-1.png',
      'link': 'https://www.baidu.com/'
    },
    {
      'name': '门票.玩乐',
      'imgSrc': 'images/top-link-2.png',
      'link': 'https://www.baidu.com/'
    },
    {
      'name': '美食',
      'imgSrc': 'images/top-link-3.png',
      'link': 'https://www.baidu.com/'
    },
    {
      'name': '向导.包车',
      'imgSrc': 'images/top-link-4.png',
      'link': 'https://www.baidu.com/'
    },
    {
      'name': '全球购',
      'imgSrc': 'images/top-link-5.png',
      'link': 'https://www.baidu.com/'
    },
  ];

  var gridLinks = [
    {
      'name': '酒店',
      'imgSrc': 'images/grid-big-2.png',
      'link': '#',
      'child': [
        {'name': '民宿.客栈', 'imgSrc': 'images/grid-1-1.png', 'liink': '#'},
        {'name': '特价.爆款', 'imgSrc': 'images/grid-1-2.png', 'liink': '#'},
      ],
    },
    {
      'name': '机票',
      'imgSrc': 'images/grid-big-2.png',
      'link': '#',
      'child': [
        {'name': '火车票', 'imgSrc': 'images/grid-1-1.png', 'liink': '#'},
        {'name': '汽车.船票', 'imgSrc': 'images/grid-1-2.png', 'liink': '#'},
        {'name': '专车.租车', 'imgSrc': 'images/grid-1-2.png', 'liink': '#'},
      ],
    },
    {
      'name': '旅游',
      'imgSrc': 'images/grid-big-3.png',
      'link': '#',
      'child': [
        {'name': '周边游', 'imgSrc': 'images/grid-2-1.png', 'liink': '#'},
        {'name': '旅游地图', 'imgSrc': 'images/grid-2-1.png', 'liink': '#'},
        {'name': '定制游', 'imgSrc': 'images/grid-2-1.png', 'liink': '#'},
      ],
    },
  ];
  List gridChild = [
    {'name': '火车票', 'imgSrc': 'images/grid-1-1.png', 'liink': '#'},
    {'name': '汽车.船票', 'imgSrc': 'images/grid-1-2.png', 'liink': '#'},
    {'name': '专车.租车', 'imgSrc': 'images/grid-1-2.png', 'liink': '#'},
  ];

  int _currentIndex = 0;
  int _tabIndex = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = 0;
    });
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      // 防止输出两次
      if (_tabController.index == _tabController.animation.value) {
        setState(() {
          _tabIndex = _tabController.index;
        });
        print(_tabIndex.toString() + '--' + _tabController.index.toString());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  TabController _tabController;

  static const _mainColor = Color(0xFF006FF5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //
        // titleSpacing:10, // 设置标题距离屏幕左右的边距
        toolbarHeight: 90,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Color(0x4CFFFFFF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('去搜索页面');
                      },
                      child: Row(
                        children: [
                          Image(
                              image: AssetImage("images/zoom-1.png"),
                              height: 16),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 5,
                            ),
                            child: Text(
                              '长隆周年庆，门票7折起！',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('跳去地图页面');
                      },
                      child: Image(
                          image: AssetImage("images/addr-1.png"), height: 18),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('查看消息');
              },
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(Icons.message),
                  Container(
                    width: 8,
                    height: 8,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ],
        ),
        bottom: TabBar(
          tabs: tabs.asMap().entries.map((entry) => _tabs(entry)).toList(),
//          controller: TabController(length: tabs.length,vsync: this), // 会报错
          controller: _tabController,
          isScrollable: true,
          labelStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          unselectedLabelStyle: TextStyle(fontSize: 18, color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF006FF5),
            Color(0xB238A6FF),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
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
        // 从0开始
        onTap: (int index) async {
//          _pageController.jumpToPage(index);

          setState(() {
            _currentIndex = index;
          });
          String routeName = '';

          switch (index) {
            case 0:
              routeName = 'home_page';
              break;
            case 1:
              routeName = 'trip_page';
              break;
            case 2:
              routeName = 'travel_page';
              break;
            case 3:
              routeName = 'service_page';
              break;
            case 4:
              routeName = 'my_page';
              break;
            default:
              routeName = 'home_page';
              break;
          }
          var route = await Navigator.pushNamed(context, routeName,
              arguments: {'lsk': '4343'});
//            print('路由返回了$route');
          _currentIndex = 0;
        },
      ),
      body: Column(
        children: [
          Container(
            height: 90,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: topLinks.map((item) => _topLink(item)).toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
             borderRadius:BorderRadius.circular(10) ,
              child: Column(
                children: gridLinks
                    .asMap()
                    .entries
                    .map((entry) => _gridLink(entry))
                    .toList(),
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget _gridLink(entry) {
    return GestureDetector(
        child: Container(
        decoration: BoxDecoration(
          border: Border(bottom:BorderSide(color: Colors.white,width: entry.key==2?0:1),)
        ),
          child:Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 130,
                  height: 85,
                  color: entry.key == 0 ? Color(0xFF4392F9): entry.key == 1 ? Color(0xFF4392F9) : Color(0xFF33C6B6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(entry.value['imgSrc']),
                        height: 50,
                      ),
                      Text(
                        entry.value['name'],
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: gridChild.asMap().entries.map((child) => _gridLinkItem(child, entry.key))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _gridLinkItem(child, index) {
    var item = child.value;
    var key = child.key;
    return Expanded(
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          color: index == 0
              ? Color(0xFFFFF1E6)
              : index == 1 ? Color(0xFFE8F5FE) : Color(0xFFE4FBF5),
          border: Border(left: BorderSide(color: Colors.white,width: key==0?0:1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Image(
                image: AssetImage( item['imgSrc']),
                height: 35,
              ),
            ),
            Text(
              item['name'],
              style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
            ),
          ],
        ),
      ),
    );
  }

  // 顶部的链接
  Widget _topLink(item) {
    return GestureDetector(
      onTap: () {
//        print("跳转到对应的页面：" + item['link']);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage(item['imgSrc']),
            height: 30,
          ),
          Text(
            item['name'],
            style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
          )
        ],
      ),
    );
  }

  // 顶部的导航栏
  Widget _tabs(entry) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(bottom: 5),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Offstage(
                    offstage: entry.key != 1,
                    child: GestureDetector(
                      onTap: () {
                        print('跳去手机页面');
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Image(
                          image: AssetImage('images/fire.png'),
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    entry.value,
                  ),
                ],
              )),
          Offstage(
            // true 为不显示，false 显示
            offstage: _tabIndex != entry.key || entry.key == 1,
            child: Container(
              width: 20,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
