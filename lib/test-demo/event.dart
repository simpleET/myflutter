import 'package:flutter/material.dart';

// 8.1 原始指针事件处理
class MyEvent extends StatefulWidget {
  @override
  _MyEvent createState() {
    return _MyEvent();
  }
}

class _MyEvent extends State<MyEvent> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('测试事件处理'),
        // 所有事件
        Listener(
//          behavior: HitTestBehavior.opaque,
//          behavior: HitTestBehavior.deferToChild,
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 300,
            height: 150,
            child: Text(
              _event?.toString() ?? '',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPointerDown: (PointerDownEvent event) {
            setState(() {
              _event = event;
            });
          },
          onPointerMove: (PointerMoveEvent event) {
            setState(() {
              _event = event;
            });
          },
          onPointerUp: (PointerUpEvent event) {
            setState(() {
              _event = event;
            });
          },
          onPointerCancel: (PointerCancelEvent event) {
            setState(() {
              _event = event;
            });
          },
        ),

        // 单独事件
        Listener(
//          behavior: HitTestBehavior.opaque, //
          child: ConstrainedBox( //  改容器是透明的，所以不加  HitTestBehavior.opaque
            // 点击是没有效果的
            constraints: BoxConstraints.tight(Size(200,150)),
            child: Center(child: Text('Box A'),),
          ),
          onPointerDown: (PointerDownEvent event){
            print('Down A');
          },
        ),
        Listener(
//          behavior: HitTestBehavior.deferToChild,
          child: Container(
            width:100,
            height: 100,
            color: Color.fromRGBO(0, 0, 0, 0.5), // 在这里改变透明度对结果不会有影响
            margin: EdgeInsets.only(bottom: 10),
            child: Text('Box A1',style: TextStyle(color: Colors.red),),
          ),
          onPointerDown: (PointerDownEvent event){
            print('Down A1');
          },
        ),

        Stack(
          children: <Widget>[
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.blue)),
              ),
              onPointerDown: (event) => print("down0"),
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                child: Center(child: Text("左上角200*100范围内非文本区域点击")),
              ),
              onPointerDown: (event) => print("down1"),
              behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
            )
          ],
        ),

        // 忽略PointerEvent
        Listener(
//          child: AbsorbPointer( // 输出 up
          child: IgnorePointer( // 本身不参与命中猜测是，所以没有输出
            child: Listener(
              child: Container(
                color: Colors.red,
                width: 200.0,
                height: 100.0,
                margin: EdgeInsets.symmetric(vertical: 10),
              ),
              onPointerDown: (event)=>print("in"),
            ),
          ),
          onPointerDown: (event)=>print("up"),
        )
      ],
    );
  }
}
