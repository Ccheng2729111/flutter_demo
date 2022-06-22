import 'package:flutter/material.dart';
import 'package:zeeker_flutter_demo/rowAndColumn.dart';

import 'home.dart';
import 'lifeCycle.dart';
import 'painDemo.dart';
import 'listViewDemo.dart';
import 'shareDataDemo.dart';
import 'stateDemo.dart';
import 'routeDemo.dart';
import 'errorPage.dart';
import 'argumentRoute.dart';
import 'form_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //默认主题色色值
  late Color _themeColor = Color(0xFF2196F3);
  //当前是否为暗黑主题
  late bool _darkTheme = false;
  // This widget is the root of your application.

  // 切换主题颜色
  void changeThemeColor(color) {
    setState(() {
      _themeColor = color;
    });
  }

  //切换暗黑主题
  void switchDark(val) {
    setState(() {
      _darkTheme = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zeekr-flutter-demo',
      debugShowCheckedModeBanner: false, //隐藏debug标识符
      theme: ThemeData(
        brightness: _darkTheme ? Brightness.dark : Brightness.light,
        primaryColorLight: _themeColor,
        colorScheme: _darkTheme
            ? ColorScheme.dark().copyWith(primary: _themeColor)
            : ColorScheme.light().copyWith(primary: _themeColor),
      ),
      initialRoute: '/', //默认路由显示
      routes: {
        '/': (context) => HomePage(
            //首屏路由 接受props
            themeColor: _themeColor,
            changeThemeColor: changeThemeColor,
            darkTheme: _darkTheme,
            switchDark: switchDark),
        '/listViewDemo': (context) => ListViewDemo(), //滚动列表demo
        '/stateDemo': (context) => CountDemo(), //状态组件
        '/routeDemo': (context) => RouteDemo(), //路由demo
        '/painDemo': (context) => PainDemo(), //canvas demo
        '/shareDataDemo': (context) => ShareDataDemo(), //共享数据存储demo
        '/formDemo': (context) => FormDemo(), //form表单demo
        '/lifeCycle': (context) => Parent(), //form表单demo
        '/rowAndColumnDemo': (context) => RowAndColumn(), //布局demo
        '/routeDemo/argument': (context) => ArgumentsRoute(), //参数路由传递demo
      },
      //兜底页面
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => ErrorPage()),
    );
  }
}
