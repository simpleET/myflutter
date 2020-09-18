import 'package:flutter/material.dart';

import 'dialog_checkbox.dart';

// 用来练习用的

class MyDialog extends StatefulWidget {
  @override
  _MyDialog createState() {
    return _MyDialog();
  }
}

class _MyDialog extends State {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 警告弹窗
        RaisedButton(
          child: Text('对话框1--AlertDialog'),
          onPressed: () async {
            bool delete = await showDeleteConfirmDialog1(context);
            if (delete == null) {
              print('取消删除');
            } else {
              print('确认删除');
            }
          },
        ),
        // 下拉选择弹窗
        RaisedButton(
          child: Text('选择框-showDialog'),
          onPressed: () async {
            int i = await showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text('请选择语言'),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, 1);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text('中文简体'),
                        ),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, 2);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text('美式英语'),
                        ),
                      )
                    ],
                  );
                });

            if (i != null) {
              print('选择了${i == 1 ? '中文简体' : '美式英语'}');
            }
          },
        ),
        // Dialog
        FlatButton(
          child: Text('对话框- Dialog'),
          color: Colors.blue[300],
          textColor: Colors.white,
          onPressed: () async {
            int index = await longDialog(context);

            if (index != null) {
              print('点击了第$index个');
            }
          },
        ),
        // 有多选框的对话框
        RaisedButton(
          child: Text(' 有多选框的对话框'),
          onPressed: () async {
            bool deleteTree = await showDeleteConfirmDialog3(context);

            if (deleteTree == null) {
              print('取消删除');
            } else {
              print('同时删除子目录:$deleteTree');
            }
          },
        ),
        // 底部菜单列表
        RaisedButton(
          child: Text('底部菜单弹窗'),
          onPressed: () async {
            int type = await _showModalBottomSheet(context);

            print(type);
          },
        ),
        // Loading 框
        RaisedButton(
          child: Text('Loading框'),
          onPressed: () async {
            await _showLoadingDialog(context);
          },
        ),
      ],
    );
  }
}

// Loading 框
_showLoadingDialog(context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 200,
            child:  AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(top: 26),
                    child: Text('加载中...'),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

Future<int> _showModalBottomSheet(context) {
  // showBottomSheet
  return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('$index'),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      });
}

Future<int> longDialog(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            children: [
              ListTile(
                title: Text('请选择'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('$index'),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  },
                ),
              )
            ],
          ),
        );
      });
}

Future<bool> showDeleteConfirmDialog1(context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('你确定要删除该文件吗？'),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('确定删除'),
              onPressed: () => Navigator.of(context).pop(true),
            )
          ],
        );
      });
}

// CheckBox 同时删除子目录
Future<bool> showDeleteConfirmDialog3(context) {
  bool _withTree = false;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('你确定要删除当前文件？'),
              Row(
                children: [
                  Text('同时删除子目录?'),
                  // 方法1
                  /* DialogCheckbox(
                    value: _withTree,
                    onChanged: (bool value) {
                      // 更新选中状态
                      _withTree = !_withTree;
                    },
                  )*/
                  // 方法2
                  /* Checkbox( // 依然使用Checkbox组件
                    value: _withTree,
                    onChanged: (bool value) {
                      // 此时context为对话框UI的根Element，我们
                      // 直接将对话框UI对应的Element标记为dirty
                      (context as Element).markNeedsBuild();
                      _withTree = !_withTree;
                    },
                  ),*/
                  // 最优方法3
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: _withTree,
                        onChanged: (bool value) {
                          (context as Element).markNeedsBuild();
                          _withTree = !_withTree;
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                return Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('删除'),
              onPressed: () => Navigator.of(context).pop(_withTree),
            )
          ],
        );
      });
}
