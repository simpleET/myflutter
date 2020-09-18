import 'package:flutter/material.dart';

// 单独封装一个内部管理选中状态的复选框组件
class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({Key key, this.value, @required this.onChanged});

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckbox createState() {
    return _DialogCheckbox();
  }
}

class _DialogCheckbox extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value; // this.widget.value
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        setState(() {
          //将选中状态通过事件的形式抛出
          widget.onChanged(v);
          //更新选中状态
          value = v;
        });
      },
    );
  }
}

