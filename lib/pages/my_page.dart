import 'dart:math';

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

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double pixels = _scrollController.position.pixels;
      double alpha = 0;

      if (pixels >= 200) {
        alpha = 1;
      } else if(pixels==0){
        alpha =1;
      } else{
        alpha = pixels / 200;
      }


      if (alpha < 0.2) {
        alpha = 0.2;
      }

      setState(() {
        _opacity = alpha;
        _scrollTop = pixels;

        if(pixels>20){
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
        appBar: AppBar(
          toolbarHeight: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: _scrollTop > 0
                        ? [Colors.white, Colors.white]
                        : [
                      Color(0xFF38A6FF),
                      Color(0xFF006FF5),
                    ])),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Opacity(
                opacity: _opacity,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: _scrollTop > 0
                              ? [Colors.white, Colors.white]
                              : [
                                  Color(0xFF38A6FF),
                                  Color(0xFF006FF5),
                                ])),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                                        borderRadius: BorderRadius.circular(10),
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
                child: Container(
//               height: MediaQuery.of(context).size.height-80,
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      // 头像 --蓝色背景栏
                      Container(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 20, bottom: 50),
                        decoration: BoxDecoration(
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
                                      margin: EdgeInsets.only(right: 10),
                                      child: ClipRRect(
                                        child: Image(
                                          image:
                                              AssetImage('images/my/head.jpg'),
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
                                          MainAxisAlignment.spaceBetween,
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
                                                margin:
                                                    EdgeInsets.only(left: 15),
                                                padding: EdgeInsets.only(
                                                    top: 4,
                                                    right: 5,
                                                    bottom: 4,
                                                    left: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(0xFF006FF5),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      '实名认证',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    ),
                                                    Icon(Icons.chevron_right,
                                                        color: Colors.white,
                                                        size: 20),
                                                  ],
                                                ))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 15),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color(0xFF006FF5),
                                              ),
                                              child: Text(
                                                '领会员福利',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color(0xFF006FF5),
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
                              height: 45,
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
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '我的收藏',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
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
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '浏览历史',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
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
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '我的积分',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
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
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '优惠券',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      // 测试用的容器
                      Container(
                        height: 500,
                        color: Colors.teal,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
