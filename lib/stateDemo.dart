import 'package:flutter/material.dart';

import 'CommonAppBar.dart';

//当前有状态widget
class CountDemo extends StatefulWidget {
  @override
  _CountDemoState createState() => _CountDemoState();
}

//继承State控件 可以声明生命周期以及拥有自己的state
class _CountDemoState extends State<CountDemo> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CommonAppBar(
          title: 'Status Demo',
        ),
      ),
      body: Center(
        child: Text(
          'the count is $_counter',
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //scaffld自带的浮动按钮控件
        onPressed: () {
          setState(() {
            _counter++; //每次点击state _counter++
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
