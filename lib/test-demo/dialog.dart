import 'package:flutter/material.dart';

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

            if(index!=null){
              print('点击了第$index个');
            }
          },
        ),

      ],
    );
  }
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
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      title: Text('$index'),
                      onTap: ()=>Navigator.of(context).pop(index),
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
