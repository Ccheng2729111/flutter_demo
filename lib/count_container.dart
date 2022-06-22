import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  void _incrementCounter() => setState(() {
        count++;
      });

  @override
  Widget build(BuildContext context) {
    return CountContainer(
        //increment: _incrementCounter,
        model: this,
        increment: _incrementCounter,
        child: Counter());
  }
}

//利用inheritedWidget定义需要传输的数据以及方法
class CountContainer extends InheritedWidget {
  static CountContainer of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CountContainer>()
          as CountContainer;

  final _CounterPageState model;

  final Function() increment;

  CountContainer({
    Key? key,
    required this.model,
    required this.increment,
    required Widget child,
  }) : super(key: key, child: child);

  //监听当前model是否发生改变，发生改变后需要触发function
  @override
  bool updateShouldNotify(CountContainer oldWidget) => model != oldWidget.model;
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //使用的话 直接利用CountContainer.of传递当前的context 拿到state
    CountContainer state = CountContainer.of(context);

    return Scaffold(
      body: Text(
        'You have pushed the button this many times: ${state.model.count}',
      ),
      floatingActionButton: FloatingActionButton(onPressed: state.increment),
    );
  }
}
