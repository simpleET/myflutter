
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPage createState() {
    return _MyPage();
  }
}

class _MyPage extends State {
  double _opacity = 1;
  double _scrollTop = 0;
  Color _colorTopIcon = Colors.white;

  List _line2 = [
    {
      'name': '全部订单',
      'imgSrc': 'images/my/my-icon-1.png',
      'msgNum': 200,
    },
    {
      'name': '待付款',
      'imgSrc': 'images/my/my-icon-2.png',
      'msgNum': 0,
    },
    {
      'name': '未出行',
      'imgSrc': 'images/my/my-icon-3.png',
      'msgNum': 99,
    },
    {
      'name': '待点评',
      'imgSrc': 'images/my/my-icon-4.png',
      'msgNum': 27,
    },
  ];

  List _myWallet = [
    {
      'name': '拿去花',
      'imgSrc': 'images/my/my-icon-10.png',
      'msgNum': 200,
    },
    {
      'name': '借现金',
      'imgSrc': 'images/my/my-icon-13.png',
      'msgNum': 0,
    },
    {
      'name': '理财',
      'imgSrc': 'images/my/my-icon-11.png',
      'msgNum': 99,
    },
    {
      'name': '白金卡',
      'imgSrc': 'images/my/my-icon-12.png',
      'msgNum': 27,
    },
  ];
  List _myTool = [
    {
      'name': '常用信息',
      'imgSrc': 'images/my/my-icon-10.png',
      'msgNum': 200,
    },
    {
      'name': '我的奖品',
      'imgSrc': 'images/my/my-icon-13.png',
      'msgNum': 0,
    },
    {
      'name': '出现清单',
      'imgSrc': 'images/my/my-icon-11.png',
      'msgNum': 99,
    },
    {
      'name': '旅行足迹',
      'imgSrc': 'images/my/my-icon-12.png',
      'msgNum': 27,
    },
    {
      'name': '航班助手',
      'imgSrc': 'images/my/my-icon-10.png',
      'msgNum': 200,
    },
    {
      'name': '我的旅拍',
      'imgSrc': 'images/my/my-icon-13.png',
      'msgNum': 0,
    },
    {
      'name': '用户调研',
      'imgSrc': 'images/my/my-icon-11.png',
      'msgNum': 99,
    },
    {
      'name': '联系客服',
      'imgSrc': 'images/my/my-icon-12.png',
      'msgNum': 27,
    },
  ];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double pixels = _scrollController.position.pixels;
      double alpha = 0;

      if (pixels >= 40) {
        alpha = 1;
      } else if (pixels == 0) {
        alpha = 1;
      } else {
        alpha = pixels / 40;
      }

      if (alpha < 0.2) {
        alpha = 0.2;
      }

      setState(() {
        _opacity = alpha;
        _scrollTop = pixels;

        if (pixels > 10) {
          _colorTopIcon = Colors.black;
        } else {
          _colorTopIcon = Colors.white;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(
              color: Color(0xFFE3E3E3),
              child: Column(
                children: [
                  // 顶部固定栏
                  Opacity(
                    opacity: _opacity,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: _scrollTop > 10
                                  ? [Colors.white, Colors.white]
                                  : [
                                      Color(0xFF38A6FF),
                                      Color(0xFF006FF5),
                                    ])),
                      padding: EdgeInsets.only(
                          top: 30, right: 10, bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(
                              child: Icon(
                                Icons.crop_free,
                                size: 30,
                                color: _colorTopIcon,
                              ),
                            ),
                            onTap: () async {
                              print('3333');
                            },
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Icon(
                                    Icons.folder_shared,
                                    size: 30,
                                    color: _colorTopIcon,
                                  ),
                                ),
                                onTap: () {},
                              ),
                              GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Icon(
                                    Icons.settings,
                                    size: 30,
                                    color: _colorTopIcon,
                                  ),
                                ),
                                onTap: () {},
                              ),
                              GestureDetector(
                                child: Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Icon(
                                          Icons.message,
                                          size: 30,
                                          color: _colorTopIcon,
                                        ),
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        )
                                      ],
                                    )),
                                onTap: () {},
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ConstrainedBox(
                    // 通过ConstrainedBox来确保Stack占满屏幕
                    constraints: BoxConstraints.expand(),
                    child: ListView(
                      controller: _scrollController,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // 蓝色背景区域
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                // todo: 该容器的width 应该可以根据父元素来做的，使用Expanded 会报错
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    left: 30, right: 30, top: 20, bottom: 40),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xFF38A6FF),
                                          Color(0xFF006FF5),
                                        ])),
                                child: Column(
                                  children: [
                                    // 头像
                                    Container(
                                      height: 80,
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 80,
                                              height: 80,
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              child: ClipRRect(
                                                child: Image(
                                                  image: AssetImage(
                                                      'images/my/head.jpg'),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              )),
                                          Container(
                                            padding: EdgeInsets.only(bottom: 3),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '尊敬的会员',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 22),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 15),
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 4,
                                                                right: 5,
                                                                bottom: 4,
                                                                left: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color:
                                                              Color(0xFF006FF5),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              '实名认证',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12),
                                                            ),
                                                            Icon(
                                                                Icons
                                                                    .chevron_right,
                                                                color: Colors
                                                                    .white,
                                                                size: 20),
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 15),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5,
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color:
                                                            Color(0xFF006FF5),
                                                      ),
                                                      child: Text(
                                                        '领会员福利',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5,
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color:
                                                            Color(0xFF006FF5),
                                                      ),
                                                      child: Text(
                                                        '我的信用',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    // 积分,收藏
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '1',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '我的收藏',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '11',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '浏览历史',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '998',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '我的积分',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '2',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '优惠券',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // 主体内容区域
                            Container(
                              margin: EdgeInsets.only(top: 185),
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  // 开通会员
                                  Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: Image(
                                                    image: AssetImage(
                                                        'images/my/head.jpg'),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '你尚未升级【超级会员】',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18),
                                                  ),
                                                  Text(
                                                    '开通后立享8类会员特权',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF9E9E9E),
                                                        fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '立即开通',
                                                style: TextStyle(
                                                    color: Color(0xFF333333)),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Color(0xFFA2A2A2),
                                                size: 24,
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                  // 订单、付款、点评
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: Flex(
                                      direction: Axis.horizontal,
                                      children: _line2
                                          .map((item) => _line2Widget(item))
                                          .toList(),
                                    ),
                                  ),
                                  // 我的钱包
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    padding: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color(0xFFECECEC),
                                                    width: 1)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '我的钱包',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '查看钱包 · 礼品卡 ·     现金',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF9B9B9B),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Flex(
                                            direction: Axis.horizontal,
                                            children: _myWallet
                                                .map((item) =>
                                                    _myWalletWidget(item))
                                                .toList(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  // 我的工具
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    padding: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color(0xFFECECEC),
                                                    width: 1)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '我的工具',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '查看全部工具' '',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF9B9B9B),
                                                    size: 26,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Wrap(
//                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.center,
                                            runSpacing: 25,
                                            children: _myTool
                                                .map((item) =>
                                                    _myToolWidget(item))
                                                .toList(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  // 我的卡片
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '我的卡片',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '管理卡片',
                                              style: TextStyle(
                                                  color: Color(0xFF999999),
                                                  fontSize: 16),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_right,
                                              color: Color(0xFF999999),
                                              size: 26,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  // 会员中心
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    padding: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color(0xFFECECEC),
                                                    width: 1)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '会员中心',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF9B9B9B),
                                                    size: 26,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 20),
                                          child: Flex(
                                            direction: Axis.horizontal,
                                           crossAxisAlignment:
                                           CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:BorderRadius.circular(8),
                                                          child: Image(
                                                            image: AssetImage(
                                                                'images/banne'
                                                                    'r-1'
                                                                    '.jpg',),
                                                            height: 90,
                                                            fit:BoxFit.fill,
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            children: [
                                                             Container(
                                                               margin:EdgeInsets.only(top:4),
                                                               child: Text(
                                                                 '酒店权益大升级',
                                                                 style: TextStyle(
                                                                     color: Colors
                                                                         .black,
                                                                     fontSize:
                                                                     18),
                                                                 maxLines: 1,
                                                                 overflow:TextOverflow.ellipsis,
                                                               ),
                                                             ),
                                                              Text(
                                                                '携程会员积分专享',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFA2A2A2),
                                                                    fontSize:
                                                                        14),
                                                                maxLines: 1,
                                                                overflow:TextOverflow.ellipsis,
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: Column(
                                                    children: [
                                                    Container(
                                                      margin:EdgeInsets.only
                                                        (bottom:5),
                                                      child:   Flex(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        direction:
                                                        Axis.horizontal,
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5),
                                                            child:
                                                            Container(
                                                              height: 70,
                                                              child: Image(
                                                                image: AssetImage(
                                                                    'images/pic-1'
                                                                        '.jpg'),

                                                                fit:BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                left: 5,
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    '泰康拜博口腔十项口腔检查结构',
                                                                    style:
                                                                    TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                    maxLines: 2,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                  ),
                                                                  Text(
                                                                    '携程铂金会员以上有福利',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFFA2A2A2),
                                                                        fontSize:
                                                                        14),
                                                                    maxLines: 1,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                      Flex(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                        direction:
                                                            Axis.horizontal,
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              child: Image(
                                                                image: AssetImage(
                                                                    'images/pic-1'
                                                                    '.jpg'),
                                                                height: 70,
                                                                fit:BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 5),
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    '做任务 赢奖励',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                  Text(
                                                                    '每天签到赚积分',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFFA2A2A2),
                                                                        fontSize:
                                                                            14),
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // 测试用的容器
                        Container(
                          height: 500,
                          color: Colors.teal,
                        )
                      ],
                    ),
                  ))
                ],
              ),
            )));
  }
}

// 订单、付款、点评
Widget _line2Widget(item) {
  return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Stack(
                  alignment: Alignment.topRight,
                  overflow: Overflow.visible,
                  children: [
                    Image(
                      image: AssetImage(
                        item['imgSrc'],
                      ),
                      height: 30,
                    ),
                    Positioned(
                        right: -8,
                        top: -10,
                        child: Offstage(
                          offstage: item['msgNum'] < 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              item['msgNum'] > 99
                                  ? '99+'
                                  : item['msgNum'].toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        )),
                  ],
                )),
            Text(
              item['name'],
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ));
}

// 我的钱包
Widget _myWalletWidget(item) {
  return Expanded(
    flex: 1,
    child: GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Image(
              image: AssetImage(item['imgSrc']),
              height: 30,
            ),
          ),
          Text(
            item['name'],
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}

// 我的工具
Widget _myToolWidget(item) {
  return FractionallySizedBox(
    widthFactor: 0.25,
    child: GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Image(
              image: AssetImage(item['imgSrc']),
              height: 30,
            ),
          ),
          Text(
            item['name'],
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
