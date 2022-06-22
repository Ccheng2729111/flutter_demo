import 'package:flutter/material.dart';

//定义公共appBar
class CommonAppBar extends StatelessWidget {
  final String title;
  final bool isHome;

  const CommonAppBar({Key? key, required this.title, this.isHome = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
        leading: !isHome //根据是否为首页 显示返回按钮
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null);
  }
}
