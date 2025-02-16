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
  List<BoxShadow> _boxShadow = [
    BoxShadow(offset: Offset(0, 2), color: Color(0xFFEAEAEA), blurRadius: 5)
  ];

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
              color: Color(0xFFF5F5F5),
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
                                  ]),
                        border: Border(
                            bottom: BorderSide(
                                color: _scrollTop > 10
                                    ? Color(0xFFF7F7F7)
                                    : Colors.transparent,
                                width: 2)),
                      ),
                      padding: EdgeInsets.only(
                          top: 30, right: 10, bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(
                              child: Icon(
                                Icons.crop_free,
                                size: 24,
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
                                    size: 24,
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
                                    size: 24,
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
                                          size: 24,
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
                    child:  ListView(
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
                                      height: 60,
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 60,
                                              height: 60,
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
                                            padding: EdgeInsets.only(bottom: 5),
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
                                                          fontSize: 18),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        padding:
                                                        EdgeInsets.only(
                                                            top: 2,
                                                            right: 5,
                                                            bottom: 2,
                                                            left: 10),
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(12),
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
                                                                size: 18),
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 2,
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
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 2,
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
                                                            fontSize: 12),
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
                                      margin: EdgeInsets.only(top: 15),
                                      height: 35,
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
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                '我的收藏',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
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
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                '浏览历史',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
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
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                '我的积分',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
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
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                '优惠券',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
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
                              margin: EdgeInsets.only(top: 145),
                              padding: EdgeInsets.only(left: 10,right:10,
                                  bottom:20),
                              child: Column(
                                children: [
                                  // 开通会员
                                  Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        color: Colors.white,
                                        boxShadow: _boxShadow,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 35,
                                                height: 35,
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
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    '开通后立享8类会员特权',
                                                    style: TextStyle(
                                                        color:
                                                        Color(0xFF9E9E9E),
                                                        fontSize: 12),
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
                                                    color: Color(0xFF333333),
                                                    fontSize: 12),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Color(0xFFA2A2A2),
                                                size: 18,
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
                                      boxShadow: _boxShadow,
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
                                      boxShadow: _boxShadow,

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
                                                    fontSize: 14),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '查看钱包 · 礼品卡 ·     现金',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF9B9B9B,),
                                                    size:18,
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
                                      boxShadow: _boxShadow,

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
                                                    fontSize: 14),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '查看全部工具' '',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF9B9B9B),
                                                    size: 18,
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
                                    margin: EdgeInsets.only(bottom: 10,
                                        left:10,right:10),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '我的卡片',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '管理卡片',
                                              style: TextStyle(
                                                  color: Color(0xFF999999),
                                                  fontSize: 12),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_right,
                                              color: Color(0xFF999999),
                                              size: 18,
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
                                      boxShadow: _boxShadow,

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
                                                    fontSize: 12),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF9B9B9B),
                                                    size: 20,
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
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(8),
                                                          child: Image(
                                                            image: AssetImage(
                                                              'images/banne'
                                                                  'r-1'
                                                                  '.jpg',
                                                            ),
                                                            height: 80,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 4),
                                                                child: Text(
                                                                  '酒店权益大升级',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                      12),
                                                                  maxLines: 1,
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                ),
                                                              ),
                                                              Text(
                                                                '携程会员积分专享',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFA2A2A2),
                                                                    fontSize:
                                                                    10),
                                                                maxLines: 1,
                                                                overflow:
                                                                TextOverflow
                                                                    .ellipsis,
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
                                                        margin: EdgeInsets.only(
                                                            bottom: 10),
                                                        child: Flex(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                                  height: 50,
                                                                  child: Image(
                                                                    image: AssetImage(
                                                                        'images/pic-1'
                                                                            '.jpg'),
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                margin:
                                                                EdgeInsets
                                                                    .only(
                                                                  left: 5,
                                                                ),
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      '泰康拜博口腔十项口腔检查结构',
                                                                      style:
                                                                      TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                        12,
                                                                      /*  height:
                                                                        1.2,*/
                                                                      ),
                                                                      maxLines:
                                                                      2,
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
                                                                          10),
                                                                      maxLines:
                                                                      1,
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
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                height: 50,
                                                                fit:
                                                                BoxFit.fill,
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
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    '做任务 赢奖励',
                                                                    style:
                                                                    TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                      12,
                                                                      height:
                                                                      1.2,
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
                                                                        10),
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
                                  // 金融服务
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    padding: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      boxShadow: _boxShadow,

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
                                                '金融服务',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF9B9B9B),
                                                    size: 18,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 20),
                                                  child: Flex(
                                                    direction: Axis.horizontal,
//                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 5),
                                                                child:
                                                                ClipRRect(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      10),
                                                                  child: Image(
                                                                      image: AssetImage(
                                                                          'images/my/my-icon-6.png'),
                                                                      width:
                                                                      20),
                                                                )),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                  left: 5),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Text(
                                                                    '最高可申请20万借款额度',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                        12),
                                                                    maxLines: 1,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                  ),
                                                                  Text(
                                                                    '开通便捷/随借随还/超低利率',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFF9A9A9A),
                                                                        fontSize:
                                                                        10),
                                                                    maxLines: 1,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 1,
                                                          child: Flex(
                                                            direction:
                                                            Axis.horizontal,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                            children: [
                                                              Text('立即开通',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xFF0C86E9),
                                                                      fontSize:
                                                                      12))
                                                            ],
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Flex(
                                                    direction: Axis.horizontal,
//                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                    top: 5),
                                                                child:
                                                                ClipRRect(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      10),
                                                                  child: Image(
                                                                      image: AssetImage(
                                                                          'images/my/my-icon-6.png'),
                                                                      width:
                                                                      20),
                                                                )),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  left: 5,
                                                                  right: 5),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Text(
                                                                    '携程联名白金信用卡',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                        12),
                                                                    maxLines: 1,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                  ),
                                                                  Text(
                                                                    '免年费/享机酒折'
                                                                        '扣/最高'
                                                                        '额度50万',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFF9A9A9A),
                                                                        fontSize:
                                                                        10),
                                                                    maxLines: 1,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 1,
                                                          child: Flex(
                                                            direction:
                                                            Axis.horizontal,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                            children: [
                                                              Text('立即领取',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xFF0C86E9),
                                                                      fontSize:
                                                                      12))
                                                            ],
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                      height: 25,
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
              style: TextStyle(color: Colors.black, fontSize: 14),
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
              height: 20,
            ),
          ),
          Text(
            item['name'],
            style: TextStyle(color: Colors.black, fontSize: 12),
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
              height: 20,
            ),
          ),
          Text(
            item['name'],
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
