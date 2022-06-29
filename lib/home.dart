import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zeeker_flutter_demo/CommonAppBar.dart';

//定义route类 便于声明list 以及赋值给datas 用于遍历生成listview
class routeData {
  final String name;
  final String route;

  routeData(this.name, this.route);
}

class HomePage extends StatefulWidget {
  //定义接收的props
  final Color themeColor;
  final bool darkTheme;
  final Function changeThemeColor;
  final Function switchDark;
  //参数初始化
  const HomePage(
      {Key? key,
      required this.themeColor,
      required this.changeThemeColor,
      required this.darkTheme,
      required this.switchDark})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //根据数据模型定义初始值
  final List<routeData> _datas = [
    routeData('水平布局和垂直布局', '/rowAndColumnDemo'),
    routeData('生命周期', '/lifeCycle'),
    routeData('列表', '/listViewDemo'),
    routeData('无状态组件及有状态组件', '/stateDemo'),
    routeData('跨组件数据共享', '/shareDataDemo'),
    routeData('canvas以及画笔', '/painDemo'),
    routeData('form表单', '/formDemo'),
    routeData('路由相关', '/routeDemo'),
    routeData('动画相关', '/animation'),
  ];

  //获取随机颜色
  final Color _randomColor = Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
  @override
  //初始化 给主题属性初始值
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CommonAppBar(
          title: 'flutter demo',
          isHome: true,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, //主轴排列方式
        crossAxisAlignment: CrossAxisAlignment.start, //次轴排列方式
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 0, 16), //padding
            child: Row(
              //水平布局
              children: [
                Text('更改主题色：'),
                DropdownButton(
                  //下拉控件
                  value: widget.themeColor,
                  items: [
                    DropdownMenuItem(
                      value: Color(0xFF2196F3),
                      child: SizedBox(
                        width: 80,
                        height: 30,
                        child: Container(
                          color: Color(0xFF2196F3),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: Color(0xFFE3F2FD),
                      child: SizedBox(
                        width: 80,
                        height: 30,
                        child: Container(
                          color: Color(0xFFE3F2FD),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: Color(0xFFBBDEFB),
                      child: SizedBox(
                        width: 80,
                        height: 30,
                        child: Container(
                          color: Color(0xFFBBDEFB),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: Color(0xFF90CAF9),
                      child: SizedBox(
                        width: 80,
                        height: 30,
                        child: Container(
                          color: Color(0xFF90CAF9),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: Color(0xFF64B5F6),
                      child: SizedBox(
                        width: 80,
                        height: 30,
                        child: Container(
                          color: Color(0xFF64B5F6),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: Color(0xFF42A5F5),
                      child: SizedBox(
                        width: 80,
                        height: 30,
                        child: Container(
                          color: Color(0xFF42A5F5),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: Color(0xFF1E88E5),
                      child: SizedBox(
                        width: 80,
                        height: 30,
                        child: Container(
                          color: Color(0xFF1E88E5),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: Color(0xFF1976D2),
                      child: SizedBox(
                        width: 80,
                        height: 30,
                        child: Container(
                          color: Color(0xFF1976D2),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: Color(0xFF1565C0),
                      child: SizedBox(
                        width: 80,
                        height: 30,
                        child: Container(
                          color: Color(0xFF1565C0),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: Color(0xFF0D47A1),
                      child: SizedBox(
                        width: 80,
                        height: 30,
                        child: Container(
                          color: Color(0xFF0D47A1),
                        ),
                      ),
                    ),
                  ],
                  onChanged: (color) {
                    // eventBus.fire(ThemeColor(color!)); // 发送事件
                    widget.changeThemeColor(color);
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 0, 16),
            child: Row(
              children: [
                Text('切换暗黑主题：'),
                Switch(
                    //切换主题switch控件
                    value: widget.darkTheme,
                    onChanged: (flag) => widget.switchDark(flag))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 0, 16),
            child: Text('Demo集合：'),
          ),
          Expanded(
            //剩余控件widget child占满剩余空间不
            child: _ContentBuild(context),
          )
        ],
      ),
    );
  }

  //demo合集list view builder
  Widget _ContentBuild(BuildContext context) {
    return ListView.builder(
      itemCount: _datas.length, //遍历数据源_datas
      itemBuilder: _RowLine,
      scrollDirection: Axis.vertical, //滚动方向为垂直
    );
  }

  //单个item布局
  Widget _RowLine(BuildContext, int index) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 150,
        color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
            Random().nextInt(256), 1),
        child: Center(
          child: Text(_datas[index].name, style: TextStyle(fontSize: 18.0)),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, _datas[index].route); //根据数据源切换路由
      },
    );
  }
}
