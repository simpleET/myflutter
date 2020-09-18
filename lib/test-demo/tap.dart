import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Drap extends StatefulWidget {
  @override
  _Drap createState() => _Drap();
}

class _Drap extends State<Drap> {
  double _top = 0;
  double _left = 0;
  double _width = 100;
  double _leftB = 0;
  bool _toggle = false;

  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 100,
          color: Colors.teal[200],
          child: Stack(
            children: [
              Positioned(
                left: _left,
                top: _top,
                child: GestureDetector(
                  child: CircleAvatar(
                    child: Text('move'),
                    radius: 40,
                  ),
                  // 只允许垂直方向拖动
                  onVerticalDragUpdate: (DragUpdateDetails details) {
                    setState(() {
                      _top += details.delta.dy;
                    });
                  },
                  /* onPanDown: (DragDownDetails e) {
								  print('用户手指按下：${e.globalPosition}');
								},
								onPanUpdate: (DragUpdateDetails e) {
								  setState(() {
									_left += e.delta.dx;
									_top += e.delta.dy;
								  });
								},
								onPanEnd: (DragEndDetails e) {
								  print(e.velocity);
								},*/
                ),
              )
            ],
          ),
        ),
        // 缩放
        Container(
          height: 200,
          color: Colors.blue[300],
          child: GestureDetector(
            child: Image(
              image: AssetImage('images/pic-1.jpg'),
              width: _width,
            ),
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                _width = 200 * details.scale.clamp(0.4, 1.0);
              });
            },
          ),
        ),
        // 富文本,点击变色
        Container(
            alignment: Alignment.center,
            child: Text.rich(TextSpan(
              children: [
                TextSpan(text: '你好世界'),
                TextSpan(
                    text: '点击变色',
                    style: TextStyle(
                        fontSize: 30,
                        color: _toggle ? Colors.blue : Colors.red),
                    recognizer: _tapGestureRecognizer
                      ..onTap = () {
                        setState(() {
                          _toggle = !_toggle;
                        });
                      }),
                TextSpan(text: '你好世界')
              ],
            ))),
        // 手势冲突
        Container(
          height: 200,
        color: Colors.teal,
          child: Stack(
            children: [
              Positioned(
                top: 80.0,
                left: _leftB,
                child: Listener(
                  onPointerDown: (details) {
                    print("down");
                  },
                  onPointerUp: (details) {
                    //会触发
                    print("up");
                  },
                  child: GestureDetector(
                    child: CircleAvatar(child: Text("B")),
                    onHorizontalDragUpdate: (DragUpdateDetails details) {
                      setState(() {
                        _leftB += details.delta.dx;
                      });
                    },
                    onHorizontalDragEnd: (details) {
                      print("onHorizontalDragEnd");
                    },
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
